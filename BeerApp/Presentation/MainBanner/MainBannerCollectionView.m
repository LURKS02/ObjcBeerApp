//
//  MainBannerCollectionView.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/23.
//

#import "MainBannerCollectionView.h"

@implementation MainBannerCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        [self registerClass:[MainBannerCollectionViewCell class] forCellWithReuseIdentifier:@"bannerCell"];
    }
    return self;
}


@end
