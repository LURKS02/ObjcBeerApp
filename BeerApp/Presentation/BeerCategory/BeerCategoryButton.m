//
//  BeerCategoryButton.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/23.
//

#import "BeerCategoryButton.h"

@implementation BeerCategoryButton

- (instancetype)initWithFrame:(CGRect)frame image:(NSString*)image label:(NSString*)label {
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat imageSize = 40.0;
        self.categoryImage = [[UIImageView alloc] initWithFrame: CGRectMake(((frame.size.width - imageSize) / 2), 0, imageSize, imageSize)];
        self.categoryImage.contentMode = UIViewContentModeScaleAspectFit;
        self.categoryImage.image = [UIImage imageNamed: image];
        [self addSubview: self.categoryImage];
        
        CGFloat labelHeight = 20.0;
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, imageSize, frame.size.width, labelHeight)];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [UIFont systemFontOfSize: 12];
        self.label.text = label;
        [self addSubview: self.label];
        
    }
    return self;
}

@end
