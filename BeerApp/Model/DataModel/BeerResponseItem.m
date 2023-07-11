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
        _name = json[@"name"];
        _tagline = json[@"tagline"];
        _firstBrewed = json[@"first_brewed"];
        _beerDescription = json[@"description"];
        _imageURL = [NSURL URLWithString: json[@"image_url"]];
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
