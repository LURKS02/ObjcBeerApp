//
//  BeerCategoryCollectionViewCell.h
//  BeerApp
//
//  Created by 지혜 on 2023/07/03.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BeerCategoryCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *beerCategoryImageView;
@property (weak, nonatomic) IBOutlet UILabel *beerCategoryLabel;

@end

NS_ASSUME_NONNULL_END
