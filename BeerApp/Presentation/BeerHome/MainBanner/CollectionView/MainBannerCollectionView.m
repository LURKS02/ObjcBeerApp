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

// scrollViewDidEndDecelerating에 위치
// 각 edge로 스크롤되었을 때 인덱스 변경에 따라 스크롤의 위치 변경
- (void)pageCyclesAtEachEdgeWithImageCount: (NSInteger)imageCount
{
    NSInteger currentPage = self.contentOffset.x / self.bounds.size.width;
    if (currentPage == imageCount + 1)
    {
        [self scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:1
                                                         inSection:0]
                     atScrollPosition: UICollectionViewScrollPositionLeft animated:NO];
    }
    else if (currentPage == 0)
    {
        [self scrollToItemAtIndexPath: [NSIndexPath indexPathForRow:imageCount
                                                          inSection:0]
                     atScrollPosition: UICollectionViewScrollPositionLeft animated:NO];
    }
}

@end
