//
//  MainBannerViewController.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/23.
//

#import "MainBannerView.h"

@interface MainBannerView ()

@end


@implementation MainBannerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.layout = [[BannerFlowLayout alloc] init];
        self.imageDataProvider = [[MainBannerImageDataProvider alloc] init];
        self.collectionView = [[MainBannerCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        
        self.linePageControl = [[LinePageControl alloc]initWithNumberOfPages:[self.imageDataProvider getNumberOfPages]];
        
        self.bannerTimer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(scrollToNextPage) userInfo:nil repeats:YES];
        self.isAutoScrollEnabled = YES;
        
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
    NSInteger numberOfPages = [self.imageDataProvider getNumberOfPages];
    if (numberOfPages > 1)
    {
        if ([self.collectionView getOffsetX] == 0.0)
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
        [self.linePageControl.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:20],
        [self.linePageControl.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-20],
        [self.linePageControl.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-20],
        [self.linePageControl.heightAnchor constraintEqualToConstant:2],
        
        [self.collectionView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [self.collectionView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        [self.collectionView.topAnchor constraintEqualToAnchor:self.topAnchor],
        [self.collectionView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]
    ]];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    MainBannerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"bannerCell" forIndexPath:indexPath];
    
    NSInteger index = [self.collectionView setupIndexPathForCycleWithImageCount:[self.linePageControl numberOfPages] indexPath:indexPath];
    
    [cell setupWithImage: self.imageDataProvider.imageNames[index]
                bigLabel:
     self.imageDataProvider.bigLabelTexts[index]             smallLabel:
     self.imageDataProvider.smallLabelTexts[index]];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.imageDataProvider getNumberOfItems];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    self.isAutoScrollEnabled = NO;
}

//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//    if (!decelerate) {
//        self.isAutoScrollEnabled = YES;
//        [self startAutoScrollTimerAfterDelay];
//
//    }
//}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat currentPage = ([self.collectionView getOffsetX] / [self getWidth]);
    [self.linePageControl lineAnimationWithCurrentPage:currentPage];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (!self.isAutoScrollEnabled)
    {
        self.isAutoScrollEnabled = YES;
        [self startAutoScrollTimerAfterDelay];
    }
    CGFloat currentPage = ([self.collectionView getOffsetX] / [self getWidth]);
    [self.collectionView setCurrentPage: currentPage pageCount:[self.imageDataProvider getNumberOfPages]];
    
}

- (void)timerScrollToNextPage {
    
    CGFloat newCurrentPage = self.collectionView.currentPage + 1;
    [self.collectionView setCurrentPage:newCurrentPage pageCount:[self.imageDataProvider getNumberOfPages]];
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:self.collectionView.currentPage inSection:0]
                                               atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

- (CGFloat)getWidth {
    return self.bounds.size.width;
}
- (CGFloat)getHeight {
    return self.bounds.size.width;
}

- (void)scrollToNextPage {
    if (!self.isAutoScrollEnabled) {
        return;
    }
    [self timerScrollToNextPage];
}

- (void)startAutoScrollTimerAfterDelay {
    [self.bannerTimer invalidate];
    self.bannerTimer = nil;

    self.bannerTimer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(scrollToNextPage) userInfo:nil repeats:YES];
}

@end

