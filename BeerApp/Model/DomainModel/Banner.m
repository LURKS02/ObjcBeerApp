//
//  Banner.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/30.
//

#import "Banner.h"

@implementation Banner

- (instancetype)initWithImageName: (NSString*)imageName bigLabel:(NSString*)bigLabel smallLabel:(NSString*)smallLabel
{
    self = [super init];
    if (self) {
        _imageName = imageName;
        _bigLabel = bigLabel;
        _smallLabel = smallLabel;
    }
    return self;
}

@end
