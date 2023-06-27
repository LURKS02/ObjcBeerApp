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
    
    NSInteger index = 0;
    if (indexPath.row == 0) {
        index = self.imageDataProvider.imageNames.count - 1;
    }
    else if (indexPath.row == self.imageDataProvider.imageNames.count + 1) {
        index = 0;
    }
    else {
        index = indexPath.row - 1;
    }
    
    [cell setupWithImage: self.imageDataProvider.imageNames[index]
    bigLabel:self.imageDataProvider.bigLabelTexts[index] smallLabel:self.imageDataProvider.smallLabelTexts[index]];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageDataProvider.imageNames.count + 2;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self lineAnimationFromEachEdge:scrollView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self pageCyclesAtEachEdge:scrollView];
}

- (void)lineAnimationFromEachEdge:(UIScrollView*)scrollView {
    float pageWidth = scrollView.frame.size.width;
    NSLog(@"%f", pageWidth);
    float currentPage = (scrollView.contentOffset.x / pageWidth);
    
    if (currentPage > self.imageDataProvider.imageNames.count) {
        if (currentPage == self.imageDataProvider.imageNames.count + 1) {
            self.linePageControl.activeLine.frame = self.linePageControl.extraLine.frame;
            self.linePageControl.extraLine.frame = CGRectZero;
        }
        else {
            CGFloat maxActiveLineWidth = self.linePageControl.bounds.size.width / self.linePageControl.numberOfPages;
            
            CGFloat overflow = (currentPage - self.imageDataProvider.imageNames.count) * maxActiveLineWidth;
            
            CGFloat newActiveLineWidth = maxActiveLineWidth - overflow;
                
            float activeX = (currentPage - 1) * maxActiveLineWidth;
            
            [UIView animateWithDuration:0.1 animations:^{
                    self.linePageControl.activeLine.frame = CGRectMake(activeX, 0, newActiveLineWidth, self.linePageControl.activeLine.frame.size.height);
                    self.linePageControl.extraLine.frame = CGRectMake(0, 0, overflow, self.linePageControl.activeLine.frame.size.height);
            }];
        }
    }
    
    else if (currentPage < 1) {
        if (currentPage == 0) {
            self.linePageControl.activeLine.frame = self.linePageControl.extraLine.frame;
            self.linePageControl.extraLine.frame = CGRectZero;
        }
        else {
            CGFloat maxActiveLineWidth = self.linePageControl.bounds.size.width / self.linePageControl.numberOfPages;
            
            CGFloat overflow = (1 - currentPage) * maxActiveLineWidth;
            
            CGFloat newActiveLineWidth = maxActiveLineWidth - overflow;
            
            [UIView animateWithDuration:0.1 animations:^{
                    self.linePageControl.activeLine.frame = CGRectMake(0, 0, newActiveLineWidth, self.linePageControl.activeLine.frame.size.height);
                    self.linePageControl.extraLine.frame = CGRectMake((self.linePageControl.bounds.size.width - overflow), 0, overflow, self.linePageControl.activeLine.frame.size.height);
            }];
        }
    }
    
    else {
        [self.linePageControl setCurrentPage:currentPage - 1];
    }
}

- (void)pageCyclesAtEachEdge: (UIScrollView*) scrollView {
    NSInteger currentPage = self.collectionView.contentOffset.x / self.collectionView.bounds.size.width;
        
        if (currentPage == self.imageDataProvider.imageNames.count + 1) {
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        } else if (currentPage == 0) {
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:self.imageDataProvider.imageNames.count inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        }
}

@end

