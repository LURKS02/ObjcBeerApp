//
//  MainBannerCollectionView.h
//  BeerApp
//
//  Created by 지혜 on 2023/06/23.
//

#import <UIKit/UIKit.h>
#import "MainBannerCollectionViewCell.h"
#import "MainBannerImageDataProvider.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainBannerCollectionView : UICollectionView

@property (nonatomic) CGFloat currentPage;
@property (nonatomic) CGPoint offset;
@property (nonatomic) NSInteger numberOfItems;
@property (nonatomic) NSInteger numberOfPages;

- (NSInteger)setupIndexPathForCycleWithIndexPath:(nonnull NSIndexPath *)indexPath;

- (void)setCurrentPage:(CGFloat)currentPage;


@end

NS_ASSUME_NONNULL_END
