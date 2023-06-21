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

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* tagline;
@property (strong, nonatomic) NSString* firstBrewed;
@property (strong, nonatomic) NSString* beerDescription;
@property (strong, nonatomic) NSURL* imageURL;

- (instancetype)initWithName: (NSString*) name
                     tagline: (NSString*) tagline
                 firstBrewed: (NSString*) firstBrewed
             beerDescription: (NSString*) beerDescription
                    imageURL: (NSURL*) imageURL;

- (Beer*)toDomainModel;

@end

NS_ASSUME_NONNULL_END
