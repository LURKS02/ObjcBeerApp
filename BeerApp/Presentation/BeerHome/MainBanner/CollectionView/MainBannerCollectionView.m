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
- (NSInteger)setupIndexPathForCycleWithImageCount: (NSInteger)imageCount indexPath:(nonnull NSIndexPath *)indexPath
{
    NSInteger index = 0;
    if (indexPath.row == 0)
    {
        index = imageCount - 1;
    }
    else if (indexPath.row == imageCount + 1)
    {
        index = 0;
    }
    else
    {
        index = indexPath.row - 1;
    }
    return index;
}

- (void)setCurrentPage:(CGFloat)currentPage pageCount:(NSInteger)pageCount{
    
    if (currentPage == pageCount + 1)
    {
        [self scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:1
                                                         inSection:0]
                     atScrollPosition: UICollectionViewScrollPositionLeft animated:NO];
        _currentPage = 1;
    }
    
    else if (currentPage == 0)
    {
        [self scrollToItemAtIndexPath: [NSIndexPath indexPathForRow: pageCount inSection:0]
                     atScrollPosition: UICollectionViewScrollPositionLeft animated:NO];
        _currentPage = pageCount;
    }
    
    else
    {
        _currentPage = currentPage;
    }
    
    NSLog(@"currentPage = %f", _currentPage);
}


- (CGFloat)getOffsetX {
    return self.contentOffset.x;
}

@end
