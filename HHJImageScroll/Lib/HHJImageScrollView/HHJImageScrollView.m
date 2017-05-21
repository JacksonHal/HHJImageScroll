//
//  HHJImageScrollView.m
//  HHJImageScroll
//
//  Created by 郝好杰 on 2017/5/21.
//  Copyright © 2017年 HHJ. All rights reserved.
//

#import "HHJImageScrollView.h"
#import "HHJCollectionViewCell.h"

NSString * const cellID = @"HHJCollectionViewCell";

@interface HHJImageScrollView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong)UICollectionViewFlowLayout             *flowLayout;
@property (nonatomic, strong)UICollectionView                       *mainView;

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
}

- (void)setUpMainView {
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 0;
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

#pragma mark -UICollectionViewDelegate & UICollectionViewDatasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HHJCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    return cell;
}

@end

