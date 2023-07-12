//
//  ListSegmentedControl.m
//  BeerApp
//
//  Created by 지혜 on 2023/07/12.
//

#import "ListSegmentedControl.h"


@implementation ListSegmentedControl

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self insertSegmentWithTitle:@"인기 맥주" atIndex:0 animated:NO];
        [self insertSegmentWithTitle:@"신상품" atIndex:1 animated:NO];
        [self insertSegmentWithTitle:@"맛있는 맥주" atIndex:2 animated:NO];
        
        [self setBackgroundImage:[UIImage new] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [self setBackgroundImage:[UIImage new] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        [self setBackgroundImage:[UIImage new] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        [self setDividerImage:[UIImage new] forLeftSegmentState:UIControlStateSelected rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        
        NSDictionary *normalAttributes = @{NSForegroundColorAttributeName: [UIColor grayColor] };
        NSDictionary *selectedAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor] };
        [self setTitleTextAttributes:normalAttributes forState:UIControlStateNormal];
        [self setTitleTextAttributes:selectedAttributes forState:UIControlStateSelected];
        
        self.underline = [[UIView alloc] init];
        self.underline.backgroundColor = [UIColor blackColor];
        [self addSubview: self.underline];
        self.selectedSegmentIndex = 0;
    }
    return self;
}

- (void)initUnderlinePosition {
    CGFloat underlineHeight = 2.0;
    
    CGFloat segmentWidth = self.frame.size.width / self.numberOfSegments;
    self.underline.frame = CGRectMake(10, self.frame.size.height - underlineHeight, segmentWidth - 20, underlineHeight);
}

- (void)moveUnderlineToIndex:(NSInteger)index {
    
    CGFloat underlineHeight = 2.0;
    
    CGFloat segmentWidth = self.frame.size.width / self.numberOfSegments;
    [UIView animateWithDuration:0.2 animations:^{
        self.underline.frame = CGRectMake(segmentWidth * index + 10, self.frame.size.height - underlineHeight, segmentWidth - 20, underlineHeight);
    }];
}

@end
