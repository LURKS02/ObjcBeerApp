//
//  BeerResponseItem.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/21.
//

#import "BeerResponseItem.h"

@implementation BeerResponseItem

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

- (Beer*)toDomainModel {
    return [[Beer alloc] initWithName: self.name
                              tagline: self.tagline
                          firstBrewed: self.firstBrewed
                      beerDescription: self.beerDescription
                             imageURL: self.imageURL];
}

@end
