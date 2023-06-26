//
//  BeerCategoryButton.h
//  BeerApp
//
//  Created by 지혜 on 2023/06/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BeerCategoryButton : UIButton

@property (nonatomic, strong) UIImageView *categoryImage;
@property (nonatomic, strong) UILabel *label;

- (instancetype)initWithFrame:(CGRect)frame image:(NSString*)image label:(NSString*)label;

@end

NS_ASSUME_NONNULL_END
