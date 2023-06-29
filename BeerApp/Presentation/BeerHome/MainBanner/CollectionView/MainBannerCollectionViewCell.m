//
//  MainBannerCollectionViewCell.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/23.
//

#import "MainBannerCollectionViewCell.h"

static const CGFloat paddingFromImageHorizontal = 30;
static const CGFloat paddingFromImageVertical = 50;
static const CGFloat paddingFromText = 8;

static const CGFloat bannerTitle = 25;
static const CGFloat bannerDescription = 15;


@implementation MainBannerCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.imageView = [[UIImageView alloc]initWithFrame: self.contentView.bounds];
        self.smallLabel = [[UILabel alloc] init];
        self.bigLabel = [[UILabel alloc] init];
        
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.smallLabel];
        [self.contentView addSubview:self.bigLabel];
    }
    return self;
}

- (void)setupWithImage:(NSString*)image
              bigLabel:(NSString*)bigLabel
            smallLabel:(NSString*)smallLabel
{
    
    self.imageView.image = [UIImage imageNamed:image];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.smallLabel.text = smallLabel;
    self.smallLabel.font = [UIFont systemFontOfSize:bannerDescription
                                             weight:UIFontWeightSemibold];
    self.smallLabel.textColor = [UIColor whiteColor];
    self.smallLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.bigLabel.text = bigLabel;
    self.bigLabel.font = [UIFont systemFontOfSize:bannerTitle
                                           weight:UIFontWeightBlack];
    self.bigLabel.textColor = [UIColor whiteColor];
    self.bigLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self setupConstraints];
}

- (void)setupConstraints
{
    [NSLayoutConstraint activateConstraints:@[
        [self.imageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor],
        [self.imageView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor],
        [self.imageView.topAnchor
            constraintEqualToAnchor:self.contentView.topAnchor],
        [self.imageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor],
        
        [self.smallLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:paddingFromImageHorizontal],
        [self.smallLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-paddingFromImageVertical],
        
        [self.bigLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:paddingFromImageHorizontal],
        [self.bigLabel.bottomAnchor
            constraintEqualToAnchor:self.smallLabel.topAnchor
            constant:-paddingFromText]
    ]];
}

@end
