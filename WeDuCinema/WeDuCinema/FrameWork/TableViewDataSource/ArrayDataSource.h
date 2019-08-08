//
//  ArrayDataSource.h
//  MyThrid
//
//  Created by 耿荣林 on 2018/12/27.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^TableViewCellConfigureBlock)(id cell ,id item);
@interface ArrayDataSource : NSObject<UITableViewDataSource>
- (id)initWithItems:(NSArray *)anitems cellIdentifier:(NSString *)aCellIdentifier
     ConfigureBlock:(TableViewCellConfigureBlock)aConfigureBlock;
- (id)itemAtIndexPath:(NSIndexPath *)indexpath;
@end

NS_ASSUME_NONNULL_END
