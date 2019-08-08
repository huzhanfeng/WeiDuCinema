//
//  NetRequestManager.h
//  iOSApp
//
//  Created by 耿荣林 on 2018/8/29.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, RequestType) {
    GET,
    POST
};
typedef void(^requestBlock)(id dic);

@interface NetRequestManager : NSObject
@property (nonatomic,strong)requestBlock requestBlock;
    
/**
 网络请求
 
 @param urlStr 请求连接（接口）
 @param type 请求类型（GET/POST）
 @param parameters 请求封装的参数
 @param success 请求成功后回调block
 @param failure 请求失败后回调block
 */
+ (void)requestWithUrl:(NSString *)urlStr withRequestType:(RequestType)type postParameters:(id)parameters
               success:(void (^)(NSDictionary *resDict))success
               failure:(void (^)(NSError *error))failure;

/**
 图片上传方法

 @param urlStr 图片地址
 @param fileName  fileName
 @param imagArr <UIImage> 图片数组
 @param type 请求类型
 @param parameters 请求参数
 @param success 成功回调
 @param failure 失败回调
 */
+ (void)uploadImgWithUrl:(NSString *)urlStr withFileName:(NSString *)fileName withImgArr:(NSArray<UIImage *> *)imagArr withRequestType:(RequestType)type postParameters:(id)parameters
                 success:(void (^)(NSDictionary *resDict))success
                 failure:(void (^)(NSError *error))failure;

@end
