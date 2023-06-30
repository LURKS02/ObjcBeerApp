//
//  MainBannerImageDataProvider.h
//  BeerApp
//
//  Created by 지혜 on 2023/06/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainBannerImageDataProvider : NSObject

@property (nonatomic, strong) NSArray<NSString*> *imageNames;
@property (nonatomic, strong) NSArray<NSString*> *bigLabelTexts;
@property (nonatomic, strong) NSArray<NSString*> *smallLabelTexts;

- (NSInteger)getNumberOfPages;
- (NSInteger)getNumberOfItems;

@end

NS_ASSUME_NONNULL_END
