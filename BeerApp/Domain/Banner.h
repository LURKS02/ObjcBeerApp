//
//  Banner.h
//  BeerApp
//
//  Created by 지혜 on 2023/06/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Banner : NSObject

@property (strong, nonatomic) NSString* imageName;
@property (strong, nonatomic) NSString* bigLabel;
@property (strong, nonatomic) NSString* smallLabel;

- (instancetype)initWithImageName: (NSString*)imageName bigLabel:(NSString*)bigLabel smallLabel:(NSString*)smallLabel;

@end

NS_ASSUME_NONNULL_END
