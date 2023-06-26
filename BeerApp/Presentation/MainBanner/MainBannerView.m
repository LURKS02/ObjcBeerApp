//
//  MainBannerViewController.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/23.
//

#import "MainBannerView.h"

@interface MainBannerView ()

@end

@implementation MainBannerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.layout = [[BannerFlowLayout alloc] init];
        
        self.imageDataProvider = [[MainBannerImageDataProvider alloc] init];
        
        self.collectionView = [[MainBannerCollectionView alloc]initWithFrame:self.bounds collectionViewLayout:self.layout];
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        
        self.pageControl = [[MainBannerPageControl alloc] initWithFrame:CGRectZero imageCount: self.imageDataProvider.imageNames.count];
        self.pageControl.frame = CGRectMake(0, self.frame.size.height - 30, self.frame.size.width, 30);
        
        [self addSubview:self.collectionView];
        [self addSubview:self.pageControl];
    }
    return self;
}

/*- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.layout = [[BannerFlowLayout alloc] init];
    self.imageDataProvider = [[MainBannerImageDataProvider alloc] init];
    self.collectionView = [[MainBannerCollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.layout];
    self.pageControl = [[MainBannerPageControl alloc] initWithFrame:CGRectZero imageCount: self.imageDataProvider.imageNames.count];
    
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.pageControl];
    
}*/

/*- (void) viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.frame = CGRectMake(0, 0, self.view.frame.size.width, 300);
    self.pageControl.frame = CGRectMake(0, 300 - 30, self.view.frame.size.width, 30);
}*/

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MainBannerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"bannerCell" forIndexPath:indexPath];
    [cell setupWithImage: self.imageDataProvider.imageNames[indexPath.row]];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageDataProvider.imageNames.count;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
        CGFloat offsetX = scrollView.contentOffset.x;
        CGFloat width = scrollView.frame.size.width;
        int page = round(offsetX / width);
        self.pageControl.currentPage = page;
}

@end
