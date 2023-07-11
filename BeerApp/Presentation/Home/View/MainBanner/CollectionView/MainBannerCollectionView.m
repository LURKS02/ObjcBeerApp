//
//  MainBannerCollectionView.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/23.
//

#import "MainBannerCollectionView.h"

@implementation MainBannerCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame
           collectionViewLayout:layout];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        
        [self registerClass:[MainBannerCollectionViewCell class] forCellWithReuseIdentifier:@"bannerCell"];
    }
    return self;
}

// cellForItemAtIndexPath에 위치
// 셀에 표시할 데이터의 인덱스 설정
- (NSInteger)setupIndexPathForCycleWithIndexPath:(nonnull NSIndexPath *)indexPath
{
    NSInteger index = 0;
    if (indexPath.row == 0)
    {
        index = self.numberOfItems - 1;
    }
    else if (indexPath.row == self.numberOfItems + 1)
    {
        index = 0;
    }
    else
    {
        index = indexPath.row - 1;
    }
    return index;
}

- (void)setCurrentPage:(CGFloat)currentPage {
    
    if (currentPage == self.numberOfItems + 1)
    {
        [self scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:1
                                                         inSection:0]
                     atScrollPosition: UICollectionViewScrollPositionLeft animated:NO];
        _currentPage = 1;
    }
    
    else if (currentPage == 0)
    {
        [self scrollToItemAtIndexPath: [NSIndexPath indexPathForRow: self.numberOfItems inSection:0]
                     atScrollPosition: UICollectionViewScrollPositionLeft animated:NO];
        _currentPage = self.numberOfItems;
    }
    
    else
    {
        _currentPage = currentPage;
    }
}

//- (void)

- (CGPoint)offset {
    return self.contentOffset;
}

- (NSInteger)numberOfItems {
    return [self numberOfItemsInSection:0] - 2;
}

- (NSInteger)numberOfPages {
    return [self numberOfItemsInSection:0];
}


@end
