//
//  NetRequestManager.m
//  iOSApp
//
//  Created by 耿荣林 on 2018/8/29.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "NetRequestManager.h"
#import "AppChache.h"
#import "UIButton+WebCache.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "AppHashEncryption.h"

@implementation NetRequestManager

+ (AFHTTPSessionManager *)httpManager{
    //获取请求对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 设置请求格式
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 设置返回格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    // 返回数据解析类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.requestSerializer.timeoutInterval = 60;
    return manager;
}
    
+ (void)requestWithUrl:(NSString *)urlStr withRequestType:(RequestType)type postParameters:(id)parameters
               success:(void (^)(NSDictionary *resDict))success
               failure:(void (^)(NSError *error))failure
{
    AFHTTPSessionManager *manager = [self httpManager];
    if (type == GET) {
        //开始请求
        [manager  GET:urlStr
           parameters:parameters
             progress:^(NSProgress * _Nonnull uploadProgress) {
                 
             }
              success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                  NSMutableDictionary *resDict = [NSMutableDictionary dictionary];
                  //判断数据否存在
                  if (responseObject) {
                      //数据解析
                      resDict = (NSMutableDictionary *)[responseObject mj_JSONObject];
                      //数据缓存
                      [AppChache writeLocalCacheData:responseObject withKey:urlStr];
                  }else{
                     id dic = [AppChache readLocalCacheDataWithKey:urlStr];
                      resDict = (NSMutableDictionary *)[dic mj_JSONObject];
                  }
                  success(resDict);
              }
              failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                  failure(error);
                  NSLog(@"%@",error);
              }];
    }else{
        //开始请求
        [manager POST:urlStr
           parameters:parameters
             progress:^(NSProgress * _Nonnull uploadProgress) {
             }
              success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                  NSLog(@"-------%@",responseObject);
                  NSMutableDictionary *resDict = (NSMutableDictionary *)[responseObject mj_JSONObject];
                  NSLog(@"\n接口：%@\n返回数据：%@",parameters[@"function"],[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
                  success(resDict);
              }
              failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                  failure(error);
                  NSLog(@"\n当前接口：%@\n错误信息：%@",parameters[@"function"],error);
              }];
    }
}

+ (void)uploadImgWithUrl:(NSString *)urlStr withFileName:(NSString *)fileName withImgArr:(NSArray<UIImage *> *)imagArr withRequestType:(RequestType)type postParameters:(id)parameters
               success:(void (^)(NSDictionary *resDict))success
                 failure:(void (^)(NSError *error))failure{
    AFHTTPSessionManager *manager = [self httpManager];
    if (type == POST){
        [manager POST:urlStr parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            NSDate *date = [NSDate date];
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            [formatter setDateFormat:@"yyyy年MM月dd日hh-mm-ss"];
            NSString *dateStr = [formatter stringFromDate:date];
            for (UIImage *image in imagArr) {
                //使用hash加密，加密图片名称
                NSString *filename = [NSString stringWithFormat:@"%@",[AppHashEncryption md5LowercaseStringWithString:dateStr]];
                NSString *Newstr = [filename stringByAppendingString:@".jpg"];
                NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
                float size = imageData.length/1024.0/1024.0;
                if (size>=1) {
                    imageData = UIImageJPEGRepresentation(image, 0.3);
                }else{
                    imageData = UIImageJPEGRepresentation(image, 0.5);
                }
                [formData appendPartWithFileData:imageData name:fileName fileName:Newstr mimeType:@"image/jpeg"];
            }
        } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSMutableDictionary *resDict = (NSMutableDictionary *)[responseObject mj_JSONObject];
            
            success(resDict);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }else{
        NSLog(@"不能使用GET上传图片");
    }
}

@end
