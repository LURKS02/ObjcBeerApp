//
//  BannerTimer.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/30.
//

#import "BannerTimer.h"

@implementation BannerTimer

- (instancetype)init {
    self = [super init];
    if (self) {
        [self startAutoScrollTimer];
        self.isAutoScrollEnabled = YES;
    }
    return self;
}

- (void)startAutoScrollTimer {
    if (!self.isAutoScrollEnabled)
    {
        [self.bannerTimer invalidate];
        self.bannerTimer = nil;
        self.isAutoScrollEnabled = YES;
        
        self.bannerTimer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(scrollToNextPage) userInfo:nil repeats:YES];
    }
}

- (void)scrollToNextPage {
    if (!self.isAutoScrollEnabled)
    {
        return;
    }
    
    else
    {
        [self.delegate bannerTimerDidFire:self];
    }
}

@end
