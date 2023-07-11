//
//  MockBeerDataManager.h
//  BeerApp
//
//  Created by 지혜 on 2023/06/21.
//

#import <Foundation/Foundation.h>
#import "BeerDataManagerProtocol.h"
#import "Beer.h"

NS_ASSUME_NONNULL_BEGIN

@interface MockBeerDataManager : NSObject <BeerDataManagerProtocol>

- (void)fetchBeers: (void(^)(NSArray<Beer*> *, NSError *)) completion;

@property (nonatomic, strong, readonly, class) NSArray<Beer*> *mockBeers;

@end

NS_ASSUME_NONNULL_END
