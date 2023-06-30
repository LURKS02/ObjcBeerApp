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
    
    self.mainBannerView = [[MainBannerView alloc] initWithFrame:CGRectMake(0,
                                                                           self.view.safeAreaInsets.top,
                                                                           self.view.frame.size.width,
                                                        
                                                                           bannerHeight)];
    
    [self.view addSubview:self.mainBannerView];
}


- (void) viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.mainBannerView.frame = CGRectMake(0,
                                           self.view.safeAreaInsets.top,
                                           self.view.frame.size.width,
                                           bannerHeight);
}

@end
