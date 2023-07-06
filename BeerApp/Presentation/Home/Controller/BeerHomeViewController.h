//
//  BeerHomeViewController.h
//  BeerApp
//
//  Created by 지혜 on 2023/06/22.
//

#import "ViewController.h"
#import "MainBannerView.h"
#import "BeerCategoryCollectionViewCell.h"
#import "BeerCategoryDataProvider.h"

NS_ASSUME_NONNULL_BEGIN

@interface BeerHomeViewController : ViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic, strong)MainBannerView *mainBannerView;

@end

NS_ASSUME_NONNULL_END
