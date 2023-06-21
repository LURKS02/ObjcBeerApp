//
//  Beer.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/21.
//

#import "Beer.h"

@implementation Beer

- (instancetype)initWithName: (NSString*) name
                     tagline: (NSString*) tagline
                 firstBrewed: (NSString*) firstBrewed
             beerDescription: (NSString*) beerDescription
                    imageURL: (NSURL*) imageURL {
    
    self = [super init];
    if (self != nil) {
        _name = name;
        _tagline = tagline;
        _firstBrewed = firstBrewed;
        _beerDescription = beerDescription;
        _imageURL = imageURL;
    }
    
    return self;
}

@end
