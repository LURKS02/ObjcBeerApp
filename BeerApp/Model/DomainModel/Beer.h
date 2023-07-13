//
//  Beer.h
//  BeerApp
//
//  Created by 지혜 on 2023/06/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Beer : NSObject

@property NSInteger beerID;
@property NSString* name;
@property NSString* tagline;
@property NSString* firstBrewed;
@property NSString* beerDescription;
@property NSURL* imageURL;

- (instancetype)initWithID: (NSInteger) beerID
                      name: (NSString*) name
                   tagline: (NSString*) tagline
               firstBrewed: (NSString*) firstBrewed
           beerDescription: (NSString*) beerDescription
                  imageURL: (NSURL*) imageURL;

@end

NS_ASSUME_NONNULL_END
