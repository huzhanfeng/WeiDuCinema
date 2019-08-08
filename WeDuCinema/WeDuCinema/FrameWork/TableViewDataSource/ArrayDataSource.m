//
//  ArrayDataSource.m
//  MyThrid
//
//  Created by 耿荣林 on 2018/12/27.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "ArrayDataSource.h"
@interface ArrayDataSource()
@property (nonatomic,strong) NSArray *items;
@property (nonatomic,copy) NSString *cellIdentifier;
@property (nonatomic,copy) TableViewCellConfigureBlock configureBlock;

@end

@implementation ArrayDataSource

- (id)initWithItems:(NSArray *)anitems cellIdentifier:(NSString *)aCellIdentifier ConfigureBlock:(TableViewCellConfigureBlock)aConfigureBlock{
    self = [super init];
    if (self) {
        self.items = anitems;
        self.cellIdentifier = aCellIdentifier;
        self.configureBlock = aConfigureBlock;
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexpath{
    return self.items[indexpath.row];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    id item = [self itemAtIndexPath:indexPath];
    self.configureBlock(cell, item);
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}

@end
