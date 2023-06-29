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
        
        self.linePageControl = [[LinePageControl alloc]initWithNumberOfPages:self.imageDataProvider.imageNames.count];
        
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
    NSInteger numberOfPages = self.imageDataProvider.imageNames.count;
        if (numberOfPages > 1)
        {
            if (self.collectionView.contentOffset.x == 0.0)
            {
                self.collectionView.contentOffset = CGPointMake(self.bounds.size.width, 0);
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
    
    NSInteger index = [self.collectionView setupIndexPathForCycleWithImageCount:self.imageDataProvider.imageNames.count indexPath:indexPath];
    
    [cell setupWithImage: self.imageDataProvider.imageNames[index]
                bigLabel:
        self.imageDataProvider.bigLabelTexts[index]             smallLabel:
        self.imageDataProvider.smallLabelTexts[index]];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageDataProvider.imageNames.count + 2;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.bounds.size.width;
    CGFloat currentPage = (scrollView.contentOffset.x / pageWidth);

    [self.linePageControl lineAnimationWithCurrentPage:currentPage];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat imageCount = self.imageDataProvider.imageNames.count;
    
    [self.collectionView pageCyclesAtEachEdgeWithImageCount:imageCount];
}

@end

