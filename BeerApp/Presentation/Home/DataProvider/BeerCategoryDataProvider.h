//
//  HomeDataProvider.h
//  BeerApp
//
//  Created by 지혜 on 2023/07/03.
//

#import <Foundation/Foundation.h>
#import "BeerCategory.h"

NS_ASSUME_NONNULL_BEGIN

@interface BeerCategoryDataProvider : NSObject

@property (nonatomic, strong) NSArray<BeerCategory*> *categorys;

- (BeerCategory*)beerCategoryAtIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
