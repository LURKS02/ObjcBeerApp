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
        
        self.bigLabelTexts = @[
            @"테스트에용",
            @"Just Do It",
            @"맛있는 맥주",
            @"점심에 마시는 커피",
            @"Toy Project",
            @"배고프다"];
        
        self.smallLabelTexts = @[
            @"테스트 문구",
            @"나이키 문구",
            @"맥주 페스티벌",
            @"일을 열심히 하자",
            @"세상에서 제일 재밌는 프로젝트 1위",
            @"배가 많이고파용"];
        
    }
    return self;
}

@end
