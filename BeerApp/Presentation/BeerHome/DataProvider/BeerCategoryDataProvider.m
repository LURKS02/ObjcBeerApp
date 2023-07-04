//
//  HomeDataProvider.m
//  BeerApp
//
//  Created by 지혜 on 2023/07/03.
//

#import "BeerCategoryDataProvider.h"

@implementation BeerCategoryDataProvider

- (instancetype) init {
    self = [super init];
    if (self) {
        self.categorys = @[
        [[BeerCategory alloc] initWithCategoryImage:@"award" categoryName:@"공모전"],
        [[BeerCategory alloc]initWithCategoryImage:@"book" categoryName:@"독서"],
        [[BeerCategory alloc]initWithCategoryImage:@"bus" categoryName:@"교통"],
        [[BeerCategory alloc]initWithCategoryImage:@"cake" categoryName:@"제빵"],
        [[BeerCategory alloc]initWithCategoryImage:@"fire" categoryName:@"트렌드"],
        [[BeerCategory alloc]initWithCategoryImage:@"love" categoryName:@"소개팅"],
        [[BeerCategory alloc]initWithCategoryImage:@"option" categoryName:@"업무"],
        [[BeerCategory alloc]initWithCategoryImage:@"rocket" categoryName:@"여행"],
        [[BeerCategory alloc]initWithCategoryImage:@"shoes" categoryName:@"패션"]
        ];
    }
    return self;
}

- (BeerCategory*)beerCategoryAtIndex:(NSInteger)index {
    return self.categorys[index];
}

@end
