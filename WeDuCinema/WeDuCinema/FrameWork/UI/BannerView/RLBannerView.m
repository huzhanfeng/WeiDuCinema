//
//  RLBannerView.m
//  MyThrid
//
//  Created by 耿荣林 on 2018/12/14.
//  Copyright © 2018年 耿荣林. All rights reserved.
//

#import "RLBannerView.h"
#import "RLBannerCell.h"

//轮播间隔
static CGFloat ScrollInterval = 3.0f;

@interface RLBannerView ()<UICollectionViewDelegate,UICollectionViewDataSource> {
    
    //UI相关
    UICollectionView *_collectionView;
    
    UIPageControl *_pageControl;
    
    NSTimer *_timer;
    
    //数据
    NSMutableArray *_titles;
    
}
@end

@implementation RLBannerView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height);
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];

    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.pagingEnabled = true;
    _collectionView.backgroundColor = [UIColor clearColor];
    [_collectionView registerClass:[RLBannerCell class] forCellWithReuseIdentifier:@"RLBannerCell"];
    _collectionView.showsHorizontalScrollIndicator = false;
    [self addSubview:_collectionView];
    
    CGFloat controlHeight = 35.0f;
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - controlHeight, self.bounds.size.width, controlHeight)];
    _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    [self addSubview:_pageControl];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:ScrollInterval target:self selector:@selector(showNext) userInfo:nil repeats:true];
}

#pragma mark -
#pragma mark CollectionViewDelegate&DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _titles.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellId = @"RLBannerCell";
    RLBannerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.title = _titles[indexPath.row];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

//手动拖拽结束
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self cycleScroll];
    //拖拽动作后间隔3s继续轮播
    [_timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:ScrollInterval]];
}

//自动轮播结束
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self cycleScroll];
}

//循环显示
- (void)cycleScroll {
    NSInteger page = _collectionView.contentOffset.x/_collectionView.bounds.size.width;
    if (page == 0) {//滚动到左边
        _collectionView.contentOffset = CGPointMake(_collectionView.bounds.size.width * (_titles.count - 2), 0);
        _pageControl.currentPage = _titles.count - 2;
    }else if (page == _titles.count - 1){//滚动到右边
        _collectionView.contentOffset = CGPointMake(_collectionView.bounds.size.width, 0);
        _pageControl.currentPage = 0;
    }else{
        _pageControl.currentPage = page - 1;
    }
}


#pragma mark -
#pragma mark Setter
//设置数据时在第一个之前和最后一个之后分别插入数据
- (void)setData:(NSArray<NSString *> *)data {
    _titles = [NSMutableArray arrayWithArray:data];
    [_titles addObject:data.firstObject];
    [_titles insertObject:data.lastObject atIndex:0];
    [_collectionView setContentOffset:CGPointMake(_collectionView.bounds.size.width, 0)];
    _pageControl.numberOfPages = data.count;
}

#pragma mark -
#pragma mark 轮播方法
//自动显示下一个
- (void)showNext {
    //手指拖拽是禁止自动轮播
    if (_collectionView.isDragging) {return;}
    CGFloat targetX =  _collectionView.contentOffset.x + _collectionView.bounds.size.width;
    [_collectionView setContentOffset:CGPointMake(targetX, 0) animated:true];
}

- (void)dealloc {
    [_timer invalidate];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(sendPageNumber:)]) {
        [self.delegate sendPageNumber:indexPath];
    }
}

@end

