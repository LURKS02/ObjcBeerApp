//
//  BeerHomeViewController.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/22.
//

#import "BeerHomeViewController.h"


@interface BeerHomeViewController ()

@end

static const CGFloat bannerHeight = 300;

@implementation BeerHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mainBannerView = [[MainBannerView alloc] init];
    [self.view addSubview:self.mainBannerView];
}

- (void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.mainBannerView.frame = CGRectMake(0, self.view.safeAreaInsets.top, self.view.frame.size.width, bannerHeight);
    [self.mainBannerView.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
}


- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //[self.HomeBannerImage startSlideshow];
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //[self.HomeBannerImage stopSlideshow];
}


@end
