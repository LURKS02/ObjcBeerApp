//
//  LinePageControl.h
//  BeerApp
//
//  Created by 지혜 on 2023/06/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LinePageControl : UIView

@property (nonatomic, assign) NSInteger numberOfPages;
@property (nonatomic, assign) CGFloat currentPage;

@property (nonatomic, strong) UIView* line;
@property (nonatomic, strong) UIView* activeLine;
@property (nonatomic, strong) UIView* extraLine;

- (instancetype)initWithNumberOfPages:(NSInteger) numberOfPages;
- (void)lineAnimationWithCurrentPage:(CGFloat)currentPage;

@end

NS_ASSUME_NONNULL_END
