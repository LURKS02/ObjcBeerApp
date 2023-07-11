//
//  CategoryDataManagerProtocol.h
//  BeerApp
//
//  Created by 지혜 on 2023/07/06.
//

#import "BeerCategory.h"

@protocol CategoryDataManagerProtocol <NSObject>

- (void)fetchBeerCategories: (void (^)(NSArray<BeerCategory *> *, NSError *))completion;

@end
