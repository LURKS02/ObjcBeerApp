//
//  MainBannerCollectionViewCell.h
//  BeerApp
//
//  Created by 지혜 on 2023/06/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainBannerCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UILabel *bigLabel;
@property (strong, nonatomic) UILabel *smallLabel;

- (void)setupWithImage:(NSString*)image;

@end

NS_ASSUME_NONNULL_END
