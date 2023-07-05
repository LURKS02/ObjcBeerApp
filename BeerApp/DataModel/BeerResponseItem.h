//
//  BeerResponseItem.h
//  BeerApp
//
//  Created by 지혜 on 2023/06/21.
//

#import <Foundation/Foundation.h>
#import "Beer.h"

NS_ASSUME_NONNULL_BEGIN

@interface BeerResponseItem : NSObject

@property NSString* name;
@property NSString* tagline;
@property NSString* firstBrewed;
@property NSString* beerDescription;
@property NSURL* imageURL;

- (instancetype)initWithJSON: (NSDictionary*)json;

- (Beer*)toDomainModel;

@end

NS_ASSUME_NONNULL_END
