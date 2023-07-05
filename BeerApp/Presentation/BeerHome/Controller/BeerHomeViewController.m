//
//  BeerHomeViewController.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/22.
//

#import "BeerHomeViewController.h"


@interface BeerHomeViewController ()

#pragma mark - Properties

@property (nonatomic, strong) UICollectionView *beerCategoryCollectionView;
@property (nonatomic, strong) BeerCategoryDataProvider *beerCategoryDataProvider;

+ (NSString*) beerCategoryCellId;

@end

static const CGFloat bannerHeight = 300;

@implementation BeerHomeViewController


#pragma mark - Class Methods

+ (NSString*) beerCategoryCellId {
    return @"beerCategory";
}


#pragma mark - View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mainBannerView = [[MainBannerView alloc] init];
    self.beerCategoryDataProvider = [[BeerCategoryDataProvider alloc] init];
    UICollectionViewFlowLayout *categoryLayout = [[UICollectionViewFlowLayout alloc] init];
    
    self.beerCategoryCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:categoryLayout];
    [self.beerCategoryCollectionView setDataSource:self];
    [self.beerCategoryCollectionView setDelegate:self];
    
    [self registerBeerCategoryCell];
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
        [self.beerCategoryCollectionView.topAnchor constraintEqualToAnchor:self.mainBannerView.bottomAnchor constant: 20],
        [self.beerCategoryCollectionView.bottomAnchor constraintEqualToAnchor:self.scrollView.contentLayoutGuide.bottomAnchor]
    ]];
}

- (void)registerBeerCategoryCell {
    UINib *nib = [UINib nibWithNibName:@"BeerCategoryCollectionViewCell" bundle:nil];
    [self.beerCategoryCollectionView registerNib: nib forCellWithReuseIdentifier: [BeerHomeViewController beerCategoryCellId]];
}


#pragma mark - <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.beerCategoryDataProvider.categorys.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    BeerCategoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: [BeerHomeViewController beerCategoryCellId] forIndexPath:indexPath];
    BeerCategory *category = [self.beerCategoryDataProvider.categorys objectAtIndex:indexPath.row];
    UIImage *image = [UIImage imageNamed:category.categoryImage];
    [cell.beerCategoryImageView setImage:image];
    [cell.beerCategoryLabel setText:category.categoryName];
    return cell;
}

@end
