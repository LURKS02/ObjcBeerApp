//
//  MainBannerViewController.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/23.
//

#import "MainBannerView.h"

@interface MainBannerView () <BannerTimerDelegate>

@property (nonatomic, strong) BannerTimer* bannerTimer;

@end


@implementation MainBannerView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.layout = [[BannerFlowLayout alloc] init];
        self.imageDataProvider = [[MainBannerImageDataProvider alloc] init];
        
        self.collectionView = [[MainBannerCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        
        self.bannerTimer = [[BannerTimer alloc] init];
        self.bannerTimer.delegate = self;
        
        self.linePageControl = [[LinePageControl alloc]initWithNumberOfItems:[self.imageDataProvider numberOfItems]];
        
        [self addSubview:self.collectionView];
        [self addSubview:self.linePageControl];
        
        [self setupConstraints];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.layout.itemSize = self.bounds.size;
    NSInteger numberOfPages = [self.imageDataProvider numberOfItems];
    if (numberOfPages > 1)
    {
        if ([self.collectionView offset].x == 0.0)
        {
            [self.collectionView scrollToItemAtIndexPath: [NSIndexPath indexPathForRow: 1 inSection:0]
                                        atScrollPosition: UICollectionViewScrollPositionLeft animated:NO];
            [self.collectionView setCurrentPage:1];
        }
    }
}

- (void)setupConstraints
{
    self.linePageControl.translatesAutoresizingMaskIntoConstraints = NO;
    self.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:
     @[
        [self.collectionView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [self.collectionView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        [self.collectionView.topAnchor constraintEqualToAnchor:self.topAnchor],
        [self.collectionView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor],
        
        [self.linePageControl.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:20],
        [self.linePageControl.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-20],
        [self.linePageControl.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-20],
        [self.linePageControl.heightAnchor constraintEqualToConstant:2]
    ]];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    MainBannerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"bannerCell" forIndexPath:indexPath];
    
    NSInteger index = [self.collectionView setupIndexPathForCycleWithIndexPath:indexPath];
    Banner* target = [self.imageDataProvider.banners objectAtIndex: index];
    
    [cell setupWithImage:target.imageName
                bigLabel:target.bigLabel
              smallLabel:target.smallLabel];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.imageDataProvider numberOfItems] + 2;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.bannerTimer setIsAutoScrollEnabled: NO];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat currentPage = ([self.collectionView  offset].x / [self getWidth]);
    [self.linePageControl lineAnimationWithCurrentPage:currentPage];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self.bannerTimer startAutoScrollTimer];
    CGFloat currentPage = ([self.collectionView offset].x / [self getWidth]);
    [self.collectionView setCurrentPage: currentPage];
    
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    CGFloat currentPage = ([self.collectionView offset].x / [self getWidth]);
    [self.collectionView setCurrentPage: currentPage];
}

- (void)bannerTimerDidFire:(BannerTimer *)timer {
   
   CGFloat newCurrentPage = [self.collectionView currentPage] + 1;
    [self.collectionView scrollToItemAtIndexPath: [NSIndexPath indexPathForRow:newCurrentPage inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    //[self.collectionView setCurrentPage:newCurrentPage];
//   [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow: [self.collectionView currentPage] inSection:0]
//                               atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
}

- (CGFloat)getWidth {
    return self.bounds.size.width;
}
- (CGFloat)getHeight {
    return self.bounds.size.width;
}


@end

