//
//  BeerHomeViewController.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/22.
//

#import "BeerHomeViewController.h"


@interface BeerHomeViewController ()


#pragma mark - Properties

@property (nonatomic, strong) MainBannerView *mainBannerView;
@property (nonatomic, strong) UICollectionView *beerCategoryCollectionView;
@property (nonatomic, strong) UITableView *beerMiniListTableView;

@property NSArray<BeerCategory *> *categories;
@property NSArray<Beer *> *beers;
@property NSArray<Banner *> *banners;

+ (NSString*) beerCategoryCellId;
+ (NSString*) beerMiniListCellId;

@end


#pragma mark - Static Variables

static const CGFloat bannerHeight = 300;
static const CGFloat categoryHeight = 200;


@implementation BeerHomeViewController

#pragma mark - Class Methods

+ (NSString*) beerCategoryCellId {
    return @"beerCategory";
}

+ (NSString*) beerMiniListCellId {
    return @"beerMiniList";
}


#pragma mark - View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
    
    [self setupSubViews];
    
    [self setupConstraints];
    
}

#pragma mark - Configuration Data

- (void)configureData {
    [CategoryDataManager.sharedInstance fetchBeerCategories:^(NSArray<BeerCategory *> * _Nonnull categories, NSError * _Nonnull error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            self.categories = categories;
        }
    }];
    
    [RealBeerDataManager.sharedInstance fetchBeers:^(NSArray<Beer *> * _Nonnull beers, NSError * _Nonnull error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            self.beers = beers;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.beerMiniListTableView reloadData];
            });
        }
    }];
    
}

#pragma mark - UI Settings

- (void)setup {
    [self configureData];
}

- (void)setupSubViews {
    
    [self setupMainBannerView];
    
    [self setupCollectionView];
    
    [self setupListView];
    
}

- (void)setupMainBannerView {
    MainBannerView *mainBannerView = [[MainBannerView alloc] init];
    self.mainBannerView = mainBannerView;
    [self.scrollView addSubview: mainBannerView];
}

- (void)setupCollectionView {
    UICollectionViewFlowLayout *categoryLayout = [[UICollectionViewFlowLayout alloc] init];
    categoryLayout.itemSize = CGSizeMake(57, 80);
    categoryLayout.minimumLineSpacing = 15;
    categoryLayout.minimumInteritemSpacing = 10;
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:categoryLayout];
    self.beerCategoryCollectionView = collectionView;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    [self.scrollView addSubview:collectionView];
    [self registerBeerCategoryCell];
    
}

- (void)setupListView {
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero];
    self.beerMiniListTableView = tableView;
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.estimatedRowHeight = 350;
    [self.scrollView addSubview: tableView];
    [self registerBeerMiniListCell];
    
}

- (void)setupConstraints
{
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.mainBannerView.translatesAutoresizingMaskIntoConstraints = NO;
    self.beerCategoryCollectionView.translatesAutoresizingMaskIntoConstraints = NO;
    self.beerMiniListTableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:
     @[
        
        // scroll view
        [self.scrollView.contentLayoutGuide.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.scrollView.contentLayoutGuide.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.scrollView.contentLayoutGuide.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor],
        [self.scrollView.contentLayoutGuide.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
        
        // main banner
        [self.mainBannerView.leadingAnchor constraintEqualToAnchor:self.scrollView.contentLayoutGuide.leadingAnchor],
        [self.mainBannerView.trailingAnchor constraintEqualToAnchor:self.scrollView.contentLayoutGuide.trailingAnchor],
        [self.mainBannerView.topAnchor constraintEqualToAnchor:self.scrollView.contentLayoutGuide.topAnchor],
        [self.mainBannerView.heightAnchor constraintEqualToConstant:bannerHeight],
        
        // category
        [self.beerCategoryCollectionView.leadingAnchor constraintEqualToAnchor:self.scrollView.contentLayoutGuide.leadingAnchor constant: 20],
        [self.beerCategoryCollectionView.trailingAnchor constraintEqualToAnchor:self.scrollView.contentLayoutGuide.trailingAnchor constant: -20],
        [self.beerCategoryCollectionView.topAnchor constraintEqualToAnchor:self.mainBannerView.bottomAnchor constant: 20],
        [self.beerCategoryCollectionView.heightAnchor constraintEqualToConstant:categoryHeight],
        
        [self.beerMiniListTableView.leadingAnchor constraintEqualToAnchor: self.scrollView.contentLayoutGuide.leadingAnchor],
        [self.beerMiniListTableView.trailingAnchor constraintEqualToAnchor:self.scrollView.contentLayoutGuide.trailingAnchor],
        [self.beerMiniListTableView.topAnchor constraintEqualToAnchor:self.beerCategoryCollectionView.bottomAnchor],
        [self.beerMiniListTableView.bottomAnchor constraintEqualToAnchor:self.scrollView.contentLayoutGuide.bottomAnchor]
        
    ]];
}


#pragma mark - Register NIB

- (void)registerBeerCategoryCell {
    UINib *nib = [UINib nibWithNibName:@"BeerCategoryCollectionViewCell" bundle:nil];
    [self.beerCategoryCollectionView registerNib: nib forCellWithReuseIdentifier: [BeerHomeViewController beerCategoryCellId]];
}

- (void)registerBeerMiniListCell {
    UINib *nib = [UINib nibWithNibName:@"BeerMiniListTableViewCell" bundle:nil];
    [self.beerMiniListTableView registerNib:nib forCellReuseIdentifier: [BeerHomeViewController beerMiniListCellId]];
}


#pragma mark - UICollectionView Data Source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _categories.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    BeerCategoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: [BeerHomeViewController beerCategoryCellId] forIndexPath:indexPath];
    BeerCategory *category = [_categories objectAtIndex:indexPath.row];
    UIImage *image = [UIImage imageNamed:category.categoryImage];
    [cell.beerCategoryImageView setImage:image];
    [cell.beerCategoryLabel setText:category.categoryName];
    return cell;
}


#pragma mark - UITableView Data Source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _beers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BeerMiniListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[BeerHomeViewController beerMiniListCellId] forIndexPath: indexPath];
    Beer *beer = [_beers objectAtIndex:indexPath.row];
    
    [self getImageFromURL:beer.imageURL completion:^(UIImage *image){
        dispatch_async(dispatch_get_main_queue(), ^{
            BeerMiniListTableViewCell *updateCell = (id)[tableView cellForRowAtIndexPath: indexPath];
            if (updateCell) {
                updateCell.beerImageView.image = image;
                updateCell.beerName.text = beer.name;
                updateCell.beerTagline.text = beer.tagline;
                updateCell.beerFirstBrewed.text = beer.firstBrewed;
            }
        });
    }];
    
    return cell;
}

- (void)getImageFromURL:(NSURL *)url completion: (void (^)(UIImage *image))completion {
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL: url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            completion(image);
        }
    }];
    
    [dataTask resume];
}

@end
