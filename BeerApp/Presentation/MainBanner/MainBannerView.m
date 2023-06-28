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

- (instancetype)init {
    self = [super init];
    if (self) {
        self.layout = [[BannerFlowLayout alloc] init];
        self.imageDataProvider = [[MainBannerImageDataProvider alloc] init];
        self.collectionView = [[MainBannerCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        
        self.linePageControl = [[LinePageControl alloc] initWithNumberOfPages:self.imageDataProvider.imageNames.count];
        
        [self addSubview:self.collectionView];
        [self addSubview:self.linePageControl];
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.layout.itemSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height);
    self.collectionView.frame = self.bounds;
    self.collectionView.collectionViewLayout = self.layout;
    self.linePageControl.frame = CGRectMake(20, self.bounds.size.height - 20, self.bounds.size.width - 40, 2);
}


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MainBannerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"bannerCell" forIndexPath:indexPath];
    
    NSInteger index = [self.collectionView setupIndexPathForCycleWithImageCount:self.imageDataProvider.imageNames.count indexPath:indexPath];
    
    [cell setupWithImage: self.imageDataProvider.imageNames[index]
                bigLabel:
        self.imageDataProvider.bigLabelTexts[index]             smallLabel:
        self.imageDataProvider.smallLabelTexts[index]];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageDataProvider.imageNames.count + 2;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    CGFloat currentPage = (scrollView.contentOffset.x / pageWidth);
    CGFloat imageCount = self.imageDataProvider.imageNames.count;
    
    [self.linePageControl lineAnimationFromEachEdgeWithCurrentPage:currentPage imageCount:imageCount];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat imageCount = self.imageDataProvider.imageNames.count;
    
    [self.collectionView pageCyclesAtEachEdgeWithImageCount:imageCount];
}

@end

