//
//  MainBannerPageControl.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/23.
//

#import "MainBannerPageControl.h"

@implementation MainBannerPageControl

- (instancetype)initWithFrame:(CGRect)frame imageCount:(NSInteger) imageCount {
    self = [super initWithFrame:frame];
    if (self) {
        self.numberOfPages = imageCount;
        self.currentPage = 0;
    }
    return self;
}

@end
