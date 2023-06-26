//
//  MainBannerImageDataProvider.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/23.
//

#import "MainBannerImageDataProvider.h"

@implementation MainBannerImageDataProvider

- (instancetype)init {
    self = [super init];
    if (self) {
        self.imageNames = @[
            @"banner1",
            @"banner2",
            @"banner3",
            @"banner4",
            @"banner5",
            @"banner6"];
        
    }
    return self;
}

@end
