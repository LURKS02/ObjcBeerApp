//
//  CategoryDataManager.m
//  BeerApp
//
//  Created by 지혜 on 2023/07/06.
//

#import "CategoryDataManager.h"

@implementation CategoryDataManager

+ (instancetype)sharedInstance {
    
    static CategoryDataManager* sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CategoryDataManager alloc] init];
    });
    return sharedInstance;
}

- (void)fetchBeerCategories: (void (^)(NSArray<BeerCategory *> *, NSError *))completion
{
    NSArray<BeerCategory *> *categories = @[
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
    
    if (completion) {
        completion(categories, nil);
    }
}

@end
