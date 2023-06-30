//
//  MainBannerCollectionView.h
//  BeerApp
//
//  Created by 지혜 on 2023/06/23.
//

#import <UIKit/UIKit.h>
#import "MainBannerCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainBannerCollectionView : UICollectionView

@property (nonatomic) CGFloat currentPage;

- (NSInteger)setupIndexPathForCycleWithImageCount: (NSInteger)imageCount indexPath:(nonnull NSIndexPath *)indexPath;

- (NSInteger)getCurrentPage;
- (void)setCurrentPage:(CGFloat)currentPage pageCount:(NSInteger)pageCount;

- (CGFloat)getOffsetX;

@end

NS_ASSUME_NONNULL_END
