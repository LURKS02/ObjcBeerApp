//
//  BeerHomeViewController.h
//  BeerApp
//
//  Created by 지혜 on 2023/06/22.
//

#import "ViewController.h"
#import "BeerCategoryCollectionViewController.h"
#import "BannerSlideImageView.h"
#import "MainBannerView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BeerHomeViewController : ViewController

@property (nonatomic, strong) BannerSlideImageView *HomeBannerImage;
@property (nonatomic, strong)BeerCategoryCollectionViewController *HomeCategoryCollectionViewController;
@property (nonatomic, strong)MainBannerView *mainBannerView;

@end

NS_ASSUME_NONNULL_END
