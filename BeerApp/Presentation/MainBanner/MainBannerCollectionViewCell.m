//
//  MainBannerCollectionViewCell.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/23.
//

#import "MainBannerCollectionViewCell.h"

@implementation MainBannerCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc]initWithFrame: self.contentView.bounds];
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:self.imageView];
        
        
    }
    return self;
}

- (void)setupWithImage:(NSString*)image {
    self.imageView.image = [UIImage imageNamed:image];
}

@end
