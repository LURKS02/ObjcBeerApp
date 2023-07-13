//
//  BeerResponseItem.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/21.
//

#import "BeerResponseItem.h"

@implementation BeerResponseItem

- (instancetype)initWithJSON:(NSDictionary *)json {
    self = [super init];
    if (self) {
        _beerID = [json[@"id"] isKindOfClass:[NSNull class]] ? 0 : json[@"id"];
        _name = [json[@"name"] isKindOfClass:[NSNull class]] ? @"" : json[@"name"];
        _tagline = [json[@"tagline"] isKindOfClass:[NSNull class]] ? @"" : json[@"tagline"];
        _firstBrewed = [json[@"first_brewed"] isKindOfClass:[NSNull class]] ? @"" : json[@"first_brewed"];
        _beerDescription = [json[@"description"] isKindOfClass:[NSNull class]] ? @"" : json[@"description"];
        _imageURL = [json[@"image_url"] isKindOfClass:[NSNull class]] ? nil : [NSURL URLWithString: json[@"image_url"]];
    }
    return self;
}

- (Beer*)toDomainModel {
    return [[Beer alloc] initWithID: self.beerID
                               name: self.name
                            tagline: self.tagline
                        firstBrewed: self.firstBrewed
                    beerDescription: self.beerDescription
                           imageURL: self.imageURL];
}



@end
