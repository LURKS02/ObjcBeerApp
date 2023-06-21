//
//  MockBeerDataManager.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/21.
//

#import "MockBeerDataManager.h"

@implementation MockBeerDataManager

static NSArray<Beer*> *_mockBeers = nil;

- (void)fetchBeers: (void(^)(NSArray<Beer*> *, NSError *)) completion {
    if (completion) {
        completion(MockBeerDataManager.mockBeers, nil);
    }
}

+ (NSArray<Beer*>*) mockBeers {
    if (_mockBeers == nil) {
        Beer* beer1 = [[Beer alloc] initWithName: @"Test Beer 2023"
                                         tagline: @"best tested beer. It's very delicious!"
                                     firstBrewed: @"2023/05"
                                 beerDescription: @"이 맥주는 완전 맛있습니다 테스트도 겁나 해서 맛있습니다 다들 맛있게 먹어요~~"
                                        imageURL: [NSURL URLWithString: @"https://loremflickr.com/320/240"]];
        _mockBeers = [NSArray arrayWithObjects: beer1, nil];
    }
    return _mockBeers;
}

@end
