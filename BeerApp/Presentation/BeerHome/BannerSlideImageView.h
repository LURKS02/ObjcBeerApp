//
//  BannerSlideImageView.h
//  BeerApp
//
//  Created by 지혜 on 2023/06/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BannerSlideImageView : UIImageView

@property (nonatomic, strong) NSArray<UIImage *> *images;
@property (nonatomic, assign) NSInteger currentImageIndex;
@property (nonatomic, strong) NSTimer *timer;

- (void)startSlideshow;
- (void)stopSlideshow;

@end

NS_ASSUME_NONNULL_END
