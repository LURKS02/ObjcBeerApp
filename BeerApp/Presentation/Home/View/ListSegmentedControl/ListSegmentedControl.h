//
//  ListSegmentedControl.h
//  BeerApp
//
//  Created by 지혜 on 2023/07/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListSegmentedControl : UISegmentedControl

@property (nonatomic, strong) UIView *underline;

- (void)initUnderlinePosition;
- (void)moveUnderlineToIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
