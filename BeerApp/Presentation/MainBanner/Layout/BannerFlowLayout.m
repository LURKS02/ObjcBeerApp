//
//  BannerFlowLayout.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/23.
//

#import "BannerFlowLayout.h"

@implementation BannerFlowLayout

- (instancetype)init {
    self = [super init];
    if (self) {
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.minimumLineSpacing = 0;
        self.minimumInteritemSpacing = 0;
    }
    return self;
}

@end
