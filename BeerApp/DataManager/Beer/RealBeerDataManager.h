//
//  BeerDataManager.h
//  BeerApp
//
//  Created by 지혜 on 2023/06/21.
//

#import <Foundation/Foundation.h>
#import "BeerDataManagerProtocol.h"
#import "Beer.h"

NS_ASSUME_NONNULL_BEGIN

@interface RealBeerDataManager : NSObject <BeerDataManagerProtocol>

+ (instancetype)sharedInstance;

- (void)fetchBeer:(NSInteger)beerID completion:(void (^)(Beer*, NSError*))completion;
- (void)fetchBeers:(NSURL*)url completion:(void(^)(NSArray<Beer*> *, NSError *)) completion;

@end

NS_ASSUME_NONNULL_END
