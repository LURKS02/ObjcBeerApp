//
//  BeerDataManager.h
//  BeerApp
//
//  Created by 지혜 on 2023/06/21.
//

#import <Foundation/Foundation.h>
#import "Beer.h"

NS_ASSUME_NONNULL_BEGIN

@interface BeerDataManager : NSObject

+ (instancetype)sharedInstance;

- (void)fetchBeers: (void(^)(NSArray<Beer*> *, NSError *)) completion;

@end

NS_ASSUME_NONNULL_END
