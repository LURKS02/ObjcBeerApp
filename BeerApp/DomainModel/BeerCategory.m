//
//  BeerCategory.m
//  BeerApp
//
//  Created by 지혜 on 2023/07/03.
//

#import "BeerCategory.h"

@implementation BeerCategory

- (instancetype)initWithCategoryImage:(NSString*) categoryImage categoryName:(NSString*)categoryName {
    self = [super init];
    
    if (self) {
        _categoryImage = categoryImage;
        _categoryName = categoryName;
    }
    return self;
}

@end
