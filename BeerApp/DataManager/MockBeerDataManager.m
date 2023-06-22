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
                                 beerDescription: @"이 맥주는 완전 맛있습니다 테스트도 겁나 해서 맛있습니다 다들 맛있게 먹어요~~ 세상에 하나 밖에 없는 맥주!! 다들 많이 먹으세요!"
                                        imageURL: [NSURL URLWithString: @"https://loremflickr.com/320/240"]];
        Beer* beer2 = [[Beer alloc] initWithName: @"Test Beer 2024"
                                         tagline: @"best tested beer2. It's very delicious!"
                                     firstBrewed: @"2023/05"
                                 beerDescription: @"새로운 테스트 맥주가 출시되었어요!!"
                                        imageURL: [NSURL URLWithString: @"https://loremflickr.com/320/240"]];
        
        _mockBeers = [NSArray arrayWithObjects: beer1, beer2, nil];
    }
    return _mockBeers;
}

@end
