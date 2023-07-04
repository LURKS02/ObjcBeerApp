//
//  MainBannerImageDataProvider.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/23.
//

#import "MainBannerImageDataProvider.h"

@implementation MainBannerImageDataProvider

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.banners = @[
            [self createBannerWithImageName:@"banner1" bigLabel:@"날씨 좋은 날" smallLabel:@"진행중인 이벤트"],
            [self createBannerWithImageName:@"banner2" bigLabel:@"Just Do It" smallLabel:@"나이키 문구"],
            [self createBannerWithImageName:@"banner3" bigLabel:@"시원한 맥주" smallLabel:@"1+1 행사중"],
            [self createBannerWithImageName:@"banner4" bigLabel:@"점심에 마시는 커피" smallLabel:@"일을 열심히 하자"],
            [self createBannerWithImageName:@"banner5" bigLabel:@"Toy Project" smallLabel:@"세상에서 제일 재밌는 프로젝트"],
            [self createBannerWithImageName:@"banner6" bigLabel:@"여행도 즐겨요" smallLabel:@"패키지 공연 관람권 무료 증정"]];
    }
    return self;
}

- (Banner*)createBannerWithImageName:(NSString *)imageName bigLabel:(NSString *)bigLabel smallLabel:(NSString *)smallLabel
{
    Banner *banner = [[Banner alloc] init];
    banner.imageName = imageName;
    banner.bigLabel = bigLabel;
    banner.smallLabel = smallLabel;
    return banner;
}

- (NSInteger)numberOfItems {
    return self.banners.count;
}

@end
