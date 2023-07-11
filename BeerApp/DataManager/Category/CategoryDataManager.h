//
//  CategoryDataManager.h
//  BeerApp
//
//  Created by 지혜 on 2023/07/06.
//

#import <Foundation/Foundation.h>
#import "CategoryDataManagerProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface CategoryDataManager : NSObject <CategoryDataManagerProtocol>

+ (instancetype)sharedInstance;

- (void)fetchBeerCategories: (void (^)(NSArray<BeerCategory *> *, NSError *))completion;

@end

NS_ASSUME_NONNULL_END
