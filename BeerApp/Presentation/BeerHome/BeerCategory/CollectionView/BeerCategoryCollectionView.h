//
//  BeerCategoryCollectionView.h
//  BeerApp
//
//  Created by 지혜 on 2023/07/03.
//

#import <UIKit/UIKit.h>
#import "BeerCategoryCollectionViewCell.h"
#import "BeerCategory.h"

NS_ASSUME_NONNULL_BEGIN

@interface BeerCategoryCollectionView : UICollectionView <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *categorys;

- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout categorys:(NSArray *)categoryImages;

@end

NS_ASSUME_NONNULL_END
