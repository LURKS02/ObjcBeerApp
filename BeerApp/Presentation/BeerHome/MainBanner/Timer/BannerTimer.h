//
//  BannerTimer.h
//  BeerApp
//
//  Created by 지혜 on 2023/06/30.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MainBannerCollectionView.h"

NS_ASSUME_NONNULL_BEGIN

@class BannerTimer;

@protocol BannerTimerDelegate <NSObject>
- (void)bannerTimerDidFire:(BannerTimer *)timer;
@end

@interface BannerTimer : NSObject

@property (nonatomic, weak) id<BannerTimerDelegate> delegate;
@property (nonatomic) NSTimer *bannerTimer;
@property (nonatomic) BOOL isAutoScrollEnabled;

- (void)startAutoScrollTimer;

@end

NS_ASSUME_NONNULL_END
