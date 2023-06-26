//
//  BannerSlideImageView.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/23.
//

#import "BannerSlideImageView.h"

@implementation BannerSlideImageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame: frame];
    self.contentMode = UIViewContentModeScaleAspectFill;
    self.images = @[
        [UIImage imageNamed: @"banner1"],
        [UIImage imageNamed: @"banner2"],
        [UIImage imageNamed: @"banner3"],
        [UIImage imageNamed: @"banner4"]
    ];
    self.currentImageIndex = 0;
    self.image = self.images[self.currentImageIndex];
    return self;
}


- (void)startSlideshow {
    self.timer = [NSTimer scheduledTimerWithTimeInterval: 3.0
                                                  target: self
                                                selector: @selector(changeImage)
                                                userInfo: nil
                                                 repeats: YES];
}

- (void)stopSlideshow{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)changeImage {
    self.currentImageIndex++;
    if (self.currentImageIndex >= self.images.count) {
        self.currentImageIndex = 0;
    }
    
    self.image = self.images[self.currentImageIndex];
}

@end
