//
//  BeerMiniListTableViewCell.m
//  BeerApp
//
//  Created by 지혜 on 2023/07/11.
//

#import "BeerMiniListTableViewCell.h"

@implementation BeerMiniListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.beerImageView.backgroundColor = [UIColor redColor];
    self.beerName.backgroundColor = [UIColor blueColor];
    self.beerTagline.backgroundColor = [UIColor greenColor];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
    
}

@end
