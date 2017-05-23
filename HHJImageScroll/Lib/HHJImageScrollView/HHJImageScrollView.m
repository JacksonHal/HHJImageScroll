//
//  HHJImageScrollView.m
//  HHJImageScroll
//
//  Created by 郝好杰 on 2017/5/21.
//  Copyright © 2017年 HHJ. All rights reserved.
//

#import "HHJImageScrollView.h"
#import "UIView+HHJExtension.h"
#import "HHJCollectionViewCell.h"

NSString * const cellID = @"HHJCollectionViewCell";

#define pageControlDotDefaultSize           CGSizeMake(10, 10)

@interface HHJImageScrollView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong)UICollectionViewFlowLayout             *flowLayout;
@property (nonatomic, strong)UICollectionView                       *mainView;
@property (nonatomic, strong)NSArray                                *imagesArray;
@property (nonatomic, assign)NSInteger                              totalItemsCount;
@property (nonatomic, strong)NSTimer                                *timer;
@property (nonatomic, strong)UIControl                              *pageControl;

@end




@implementation HHJImageScrollView

+(instancetype)imageScrollViewWithFrame:(CGRect)frame isInfiniteLoop:(BOOL)isInfiiteLoop imageNamesArray:(NSArray *)imageNamesArray {
    HHJImageScrollView *imageScrollV = [[self alloc] initWithFrame:frame];
    imageScrollV.isInfiniteLoop = isInfiiteLoop;
    imageScrollV.localImageNamesArray = imageNamesArray;
    return imageScrollV;
}

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialization];
        [self setUpMainView];
    }
    return self;
}

- (void)initialization {
    self.backgroundColor = [UIColor lightGrayColor];
    
    _autoScroll = YES;
    _isInfiniteLoop = YES;
    _autoScrollDirection = UICollectionViewScrollDirectionHorizontal;
    _autoScrollTimeInterval = 2.0;
    _hidesForSinglePage = YES;
    _pageControlStyle = HHJScrollViewPageControlStyleSystem;
    _pageControlDotSize = pageControlDotDefaultSize;
    _pageControlRightOffset = 0;
    _pageControlBottomOffset = 0;
    _pageControlAliment = HHJPageControlAlimentCenter;
}

- (void)setUpMainView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _flowLayout = flowLayout;
    
    UICollectionView *mainView= [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:_flowLayout];
    mainView.backgroundColor = [UIColor redColor];
    mainView.pagingEnabled = YES;
    mainView.showsVerticalScrollIndicator = NO;
    mainView.showsHorizontalScrollIndicator = NO;
    mainView.dataSource = self;
    mainView.delegate = self;
    mainView.scrollsToTop = NO;
    [mainView registerClass:[HHJCollectionViewCell class] forCellWithReuseIdentifier:cellID];
    [self addSubview:mainView];
    _mainView = mainView;
}

-(void)setUpPageControl {
    if (_pageControl) {
        return;
    }
    if (_imagesArray.count == 0) {
        return;
    }
    if (_imagesArray.count == 0 && self.hidesForSinglePage == YES) {
        return;
    }
    switch (self.pageControlStyle) {
        case HHJScrollViewPageControlStyleAnimated:
        {
        
        }
            break;
        case HHJScrollViewPageControlStyleSystem:
        {
            UIPageControl *pageControl = [[UIPageControl alloc] init];
            pageControl.numberOfPages = self.imagesArray.count;
            pageControl.currentPage = [self pageControlIndexWithCurrentCellIndex:[self currentIndex]];
            [self addSubview:pageControl];
            _pageControl = pageControl;
        }
            break;
            
        default:
            break;
    }
    
}

#pragma mark -UICollectionViewDelegate & UICollectionViewDatasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.totalItemsCount;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HHJCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    int itemIndex = [self pageControlIndexWithCurrentCellIndex:indexPath.row];
    UIImage *image = [UIImage imageNamed:self.imagesArray[itemIndex]];
    if (!image) {
        [UIImage imageWithContentsOfFile:self.imagesArray[indexPath.row]];
    }
    cell.imageView.image = (UIImage *)image;
    return cell;
}
#pragma mark -property
-(void)setIsInfiniteLoop:(BOOL)isInfiniteLoop {
    _isInfiniteLoop = isInfiniteLoop;
    if (self.imagesArray.count) {
        self.imagesArray = self.imagesArray;
    }
}
-(void)setLocalImageNamesArray:(NSArray *)localImageNamesArray {
    _localImageNamesArray = localImageNamesArray;
    self.imagesArray = [localImageNamesArray copy];
}

-(void)setImagesArray:(NSArray *)imagesArray {
    _imagesArray = imagesArray;
    _totalItemsCount = self.isInfiniteLoop ? self.imagesArray.count*100:self.imagesArray.count;
    //开始定时器之前先暂停定时器
    [self invalidateTimer];
    if (imagesArray.count != 0) {
        self.mainView.scrollEnabled = YES;
        [self setAutoScroll:self.autoScroll];
    }else {
        self.mainView.scrollEnabled = NO;
    }
    [self setUpPageControl];
    [self.mainView reloadData];
}

-(void)setAutoScroll:(BOOL)autoScroll {
    _autoScroll = autoScroll;
    //先暂停定时器
    [self invalidateTimer];
    if (_autoScroll) {
        [self setupTimer];
    }
}

- (void)setAutoScrollDirection:(UICollectionViewScrollDirection)autoScrollDirection {
    _autoScrollDirection = autoScrollDirection;
    _flowLayout.scrollDirection = autoScrollDirection;
}

- (void)setAutoScrollTimeInterval:(CGFloat)autoScrollTimeInterval {
    _autoScrollTimeInterval = autoScrollTimeInterval;
    
    [self setAutoScroll:self.autoScroll];
}

#pragma mark -UIScrollDelegate
//当手指滑动scrollView是暂停定时器
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (self.autoScroll) {
        [self invalidateTimer];
    }
    
}
//当滑动结束时开始定时器
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (self.autoScroll) {
        [self setupTimer];
    }
}

#pragma  mark -actions
-(void)setupTimer {
    NSTimer *timer = [NSTimer timerWithTimeInterval:self.autoScrollTimeInterval target:self selector:@selector(imagesScroll) userInfo:nil repeats:YES];
    _timer = timer;
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
}

-(void)invalidateTimer {
    [_timer invalidate];
    _timer = nil;
}

-(int)pageControlIndexWithCurrentCellIndex:(NSInteger)index {
    return (int)index % self.imagesArray.count;
}

- (void)imagesScroll {
    if (0==_totalItemsCount) {
        return;
    }
    int currentIndex = [self currentIndex];
    [self scrollToNextIndex:currentIndex+1];
}

- (int)currentIndex {
    if (_mainView.hj_width == 0 || _mainView.hj_height == 0) {
        return 0;
    }
    int index = 0;
    if (_flowLayout.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
        index = (_mainView.contentOffset.x + _flowLayout.itemSize.width*0.5)/_flowLayout.itemSize.width;
    }else {
        index = (_mainView.contentOffset.y + _flowLayout.itemSize.height*0.5)/_flowLayout.itemSize.height;
    }
    return MAX(0, index);
}

- (void)scrollToNextIndex:(int)nextIndex {
    if (nextIndex >= _totalItemsCount) {
        if (self.isInfiniteLoop) {
            nextIndex = _totalItemsCount*0.5;
            [_mainView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:nextIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        }
        return;
    }
    [_mainView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:nextIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}

#pragma mark -生命周期
-(void)willMoveToSuperview:(UIView *)newSuperview {
    if (!newSuperview) {
        [self invalidateTimer];
    }
}

- (void)dealloc {
    _mainView.delegate = nil;
    _mainView.dataSource = nil;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    _flowLayout.itemSize = self.frame.size;
    _mainView.frame = self.bounds;
    
    CGSize pageControlSize = CGSizeZero;
    if ([self.pageControl isKindOfClass:[UIControl class]]) {
        pageControlSize = CGSizeMake(self.imagesArray.count*self.pageControlDotSize.width*1.5, self.pageControlDotSize.height);
    }
    CGFloat pageControlX = (self.hj_width-pageControlSize.width)/2;
    
    if (self.pageControlAliment == HHJPageControlAlimentRight) {
        pageControlX = self.mainView.hj_width - pageControlSize.width - 10;
    }
    CGFloat pageControlY = self.mainView.hj_height-pageControlSize.height-10;
    
    CGRect pageControlFrame = CGRectMake(pageControlX, pageControlY, pageControlSize.width, pageControlSize.height);
    self.pageControl.frame = pageControlFrame;
    
    
}

@end

