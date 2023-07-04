//
//  BeerHomeViewController.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/22.
//

#import "BeerHomeViewController.h"


@interface BeerHomeViewController ()

@property (nonatomic, strong) BeerCategoryCollectionView *beerCategoryCollectionView;
@property (nonatomic, strong) BeerCategoryDataProvider *beerCategoryDataProvider;

@end

static const CGFloat bannerHeight = 300;



@implementation BeerHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mainBannerView = [[MainBannerView alloc] init];
    self.beerCategoryDataProvider = [[BeerCategoryDataProvider alloc] init];
    UICollectionViewFlowLayout *categoryLayout = [[UICollectionViewFlowLayout alloc] init];
    
    self.beerCategoryCollectionView = [[BeerCategoryCollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:categoryLayout categorys:self.beerCategoryDataProvider.categorys];
    
    [self.scrollView addSubview:self.mainBannerView];
    [self.scrollView addSubview:self.beerCategoryCollectionView];
    
    [self setupConstraints];
    
}


- (void) viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

- (void)setupConstraints
{
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.mainBannerView.translatesAutoresizingMaskIntoConstraints = NO;
    self.beerCategoryCollectionView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:
     @[
        
//        [self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
//        [self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
//        [self.scrollView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
//        [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
        
        [self.scrollView.contentLayoutGuide.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.scrollView.contentLayoutGuide.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.scrollView.contentLayoutGuide.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
        [self.scrollView.contentLayoutGuide.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
        
        [self.mainBannerView.leadingAnchor constraintEqualToAnchor:self.scrollView.contentLayoutGuide.leadingAnchor],
        [self.mainBannerView.trailingAnchor constraintEqualToAnchor:self.scrollView.contentLayoutGuide.trailingAnchor],
        [self.mainBannerView.topAnchor constraintEqualToAnchor:self.scrollView.contentLayoutGuide.topAnchor],
        [self.mainBannerView.heightAnchor constraintEqualToConstant:bannerHeight],
        
        // BeerCategoryCollectionView Constraints
        [self.beerCategoryCollectionView.leadingAnchor constraintEqualToAnchor:self.scrollView.contentLayoutGuide.leadingAnchor],
        [self.beerCategoryCollectionView.trailingAnchor constraintEqualToAnchor:self.scrollView.contentLayoutGuide.trailingAnchor],
        [self.beerCategoryCollectionView.topAnchor constraintEqualToAnchor:self.mainBannerView.bottomAnchor],
        [self.beerCategoryCollectionView.bottomAnchor constraintEqualToAnchor:self.scrollView.contentLayoutGuide.bottomAnchor]
    ]];
}

@end
