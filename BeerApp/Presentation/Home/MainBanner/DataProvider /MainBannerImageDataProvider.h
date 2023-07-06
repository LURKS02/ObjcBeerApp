//
//  MainBannerImageDataProvider.h
//  BeerApp
//
//  Created by 지혜 on 2023/06/23.
//

#import <Foundation/Foundation.h>
#import "Banner.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainBannerImageDataProvider : NSObject

@property (nonatomic, strong) NSArray<Banner*> *banners;
@property (nonatomic) NSInteger numberOfItems;

@end

NS_ASSUME_NONNULL_END
