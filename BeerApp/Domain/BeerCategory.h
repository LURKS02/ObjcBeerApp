//
//  BeerCategory.h
//  BeerApp
//
//  Created by 지혜 on 2023/07/03.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BeerCategory : NSObject

@property (nonatomic, strong) NSString* categoryImage;
@property (nonatomic, strong) NSString* categoryName;

- (instancetype)initWithCategoryImage:(NSString*) categoryImage categoryName:(NSString*)categoryName;

@end

NS_ASSUME_NONNULL_END
