//
//  BeerCategoryCollectionViewCell.m
//  BeerApp
//
//  Created by 지혜 on 2023/07/03.
//

#import "BeerCategoryCollectionViewCell.h"

@implementation BeerCategoryCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    CGFloat red = 240.0;
    CGFloat green = 240.0;
    CGFloat blue = 240.0;
    self.backgroundRectangle.backgroundColor = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
    self.backgroundRectangle.layer.cornerRadius = 10.0;
}

@end
