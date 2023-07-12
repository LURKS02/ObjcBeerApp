//
//  BeerDataManager.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/21.
//

#import "RealBeerDataManager.h"
#import "BeerResponseItem.h"

@implementation RealBeerDataManager

+ (instancetype) sharedInstance {
    
    static RealBeerDataManager* sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[RealBeerDataManager alloc] init];
    });
    return sharedInstance;
}

- (void) fetchBeers:(void (^)(NSArray<Beer *> *, NSError *))completion {
    
    NSURL *url = [NSURL URLWithString:@"https://api.punkapi.com/v2/beers?page=1&per_page=80"];
    
    NSURLSessionDataTask *downloadTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (data)
        {
            NSError *jsonError;
            NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            if (jsonError)
            {
                completion(nil, jsonError);
                return;
            }
            NSMutableArray<Beer*> *beers = [NSMutableArray array];
            for (NSDictionary *item in json)
            {
                BeerResponseItem *beerResponseItem = [[BeerResponseItem alloc] initWithJSON: item];
                [beers addObject:[beerResponseItem toDomainModel]];
            }
            completion(beers, nil);
        } else {
            completion(nil, error);
        }
    }];
    [downloadTask resume];

}

@end
