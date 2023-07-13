//
//  BeerDataManagerProtocol.h
//  BeerApp
//
//  Created by 지혜 on 2023/06/21.
//

#import "Beer.h"

@protocol BeerDataManagerProtocol <NSObject>

- (void)fetchBeer:(NSInteger)beerID completion:(void (^)(Beer*, NSError*))completion;
- (void)fetchBeers:(void (^)(NSArray<Beer *> *, NSError *))completion;

@end
