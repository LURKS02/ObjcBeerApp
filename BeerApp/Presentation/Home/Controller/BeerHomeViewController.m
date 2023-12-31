//
//  BeerHomeViewController.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/22.
//

#import "BeerHomeViewController.h"


@interface BeerHomeViewController ()


#pragma mark - Properties

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) MainBannerView *mainBannerView;
@property (nonatomic, strong) UICollectionView *beerCategoryCollectionView;
@property (nonatomic, strong) ListSegmentedControl *segmentedControl;

@property NSArray<BeerCategory *> *categories;
@property NSArray<Beer *> *beers;
@property NSArray<Banner *> *banners;

+ (NSString*) beerCategoryCellId;
+ (NSString*) beerMiniListCellId;

@end


#pragma mark - Static Variables

static const CGFloat headerHeight = 600;
static const CGFloat bannerHeight = 300;
static const CGFloat categoryHeight = 200;
static const CGFloat segmentedControlHeight = 50;


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
    NSLog(@"setup done");
    
    [self setupSubViews];
    NSLog(@"setup subviews done");
    
    [self setupConstraints];
    NSLog(@"setup constraints done");
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden: YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden: NO];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.segmentedControl initUnderlinePosition];
}

#pragma mark - Configuration Data

- (void)configureData {
    
    NSURL* beerURL = [NSURL URLWithString:@"https://api.punkapi.com/v2/beers?page=1&per_page=80"];
    [self setupBeers:beerURL];
    
    [self setupCategories];
    
}

- (void)setupBeers:(NSURL*)url {
    [RealBeerDataManager.sharedInstance fetchBeers:url completion: ^(NSArray<Beer *> * _Nonnull beers, NSError * _Nonnull error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            self.beers = beers;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.mainTableView reloadData];
            });
        }
    }];
}

- (void)setupCategories {
    [CategoryDataManager.sharedInstance fetchBeerCategories:^(NSArray<BeerCategory *> * _Nonnull categories, NSError * _Nonnull error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            self.categories = categories;
        }
    }];
}


#pragma mark - UI Settings

- (void)setup {
    
    self.view.backgroundColor = UIColor.whiteColor;
    [self configureData];
    
}

- (void)_setupNavigationItem
{
    self.title = @"CoderMikeHe";
}

- (void)setupSubViews {
    
    [self setupTable];
    
    [self setupMainBannerView];
    
    [self setupCollectionView];
    
    [self setupSegmentedControl];
}

- (void)setupTable {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    self.mainTableView = tableView;
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.estimatedRowHeight = 350;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self registerBeerMiniListCell];
    
    [self.view addSubview:tableView];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectZero];
    self.headerView = headerView;
    self.mainTableView.tableHeaderView = headerView;
    headerView.frame = CGRectMake(0, 0, MAIN_SCREEN_WIDTH, headerHeight);
}

- (void)setupMainBannerView {
    MainBannerView *mainBannerView = [[MainBannerView alloc] init];
    self.mainBannerView = mainBannerView;
    [self.headerView addSubview: mainBannerView];
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
    
    [self.headerView addSubview:collectionView];
    [self registerBeerCategoryCell];
    
}

- (void)setupSegmentedControl {
    ListSegmentedControl *segmentedControl = [[ListSegmentedControl alloc] initWithFrame:CGRectZero];
    self.segmentedControl = segmentedControl;
    [segmentedControl addTarget:self action:@selector(segmentedControlChanged:) forControlEvents:UIControlEventValueChanged];
    [self.headerView addSubview: segmentedControl];
}

- (void)setupConstraints
{
    self.mainTableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.mainBannerView.translatesAutoresizingMaskIntoConstraints = NO;
    self.beerCategoryCollectionView.translatesAutoresizingMaskIntoConstraints = NO;
    self.segmentedControl.translatesAutoresizingMaskIntoConstraints = NO;
    
    UILayoutGuide *guide = self.view.safeAreaLayoutGuide;
    
    [NSLayoutConstraint activateConstraints:
     @[
        [self.mainTableView.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor],
        [self.mainTableView.trailingAnchor constraintEqualToAnchor:guide.trailingAnchor],
        [self.mainTableView.topAnchor constraintEqualToAnchor:guide.topAnchor],
        [self.mainTableView.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor],
        
        [self.mainBannerView.leadingAnchor constraintEqualToAnchor:self.headerView.leadingAnchor],
        [self.mainBannerView.trailingAnchor constraintEqualToAnchor:self.headerView.trailingAnchor],
        [self.mainBannerView.topAnchor constraintEqualToAnchor:self.headerView.topAnchor],
        [self.mainBannerView.heightAnchor constraintEqualToConstant:bannerHeight],
        
        [self.beerCategoryCollectionView.leadingAnchor constraintEqualToAnchor:self.headerView.leadingAnchor constant: 20],
        [self.beerCategoryCollectionView.trailingAnchor constraintEqualToAnchor:self.headerView.trailingAnchor constant: -20],
        [self.beerCategoryCollectionView.topAnchor constraintEqualToAnchor:self.mainBannerView.bottomAnchor constant:20],
        [self.beerCategoryCollectionView.heightAnchor constraintEqualToConstant:categoryHeight],
        
        [self.segmentedControl.leadingAnchor constraintEqualToAnchor:self.headerView.leadingAnchor constant: 5],
        [self.segmentedControl.trailingAnchor constraintEqualToAnchor:self.headerView.trailingAnchor constant: -5],
        [self.segmentedControl.topAnchor constraintEqualToAnchor:self.beerCategoryCollectionView.bottomAnchor constant: 20],
        [self.segmentedControl.heightAnchor constraintEqualToConstant:segmentedControlHeight]
    ]];
}


#pragma mark - Register NIB

- (void)registerBeerCategoryCell {
    UINib *nib = [UINib nibWithNibName:@"BeerCategoryCollectionViewCell" bundle:nil];
    [self.beerCategoryCollectionView registerNib: nib forCellWithReuseIdentifier: [BeerHomeViewController beerCategoryCellId]];
}

- (void)registerBeerMiniListCell {
    UINib *nib = [UINib nibWithNibName:@"BeerMiniListTableViewCell" bundle:nil];
    [self.mainTableView registerNib:nib forCellReuseIdentifier: [BeerHomeViewController beerMiniListCellId]];
}


#pragma mark - Actions

- (void)segmentedControlChanged:(ListSegmentedControl *)sender {
    NSInteger selectedSegment = sender.selectedSegmentIndex;
    
    if (selectedSegment == 0){
        NSURL* beerURL = [NSURL URLWithString:@"https://api.punkapi.com/v2/beers?page=1&per_page=80"];
        
        [self setupBeers:beerURL];
        
    }
    
    else if (selectedSegment == 1) {
        NSURL* beerURL = [NSURL URLWithString:@"https://api.punkapi.com/v2/beers?page=2&per_page=80"];
        
        [self setupBeers:beerURL];
        
    }
    
    else if (selectedSegment == 2) {
        NSURL* beerURL = [NSURL URLWithString:@"https://api.punkapi.com/v2/beers?page=3&per_page=80"];
        
        [self setupBeers:beerURL];
        
    }
    
    [sender moveUnderlineToIndex:selectedSegment];
}


#pragma mark - Functions

- (void)getImageFromURL:(NSURL *)url completion: (void (^)(UIImage *image))completion {
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL: url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            completion(image);
        }
    }];
    
    [dataTask resume];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger selectedID = [_beers objectAtIndex:indexPath.row].beerID;
    BeerDetailViewController *destinationController =[[BeerDetailViewController alloc] init];
    destinationController.beerID = selectedID;
}

@end
