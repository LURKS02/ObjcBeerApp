//
//  BeerHomeViewController.h
//  BeerApp
//
//  Created by 지혜 on 2023/06/22.
//

#import "ViewController.h"
#import "MainBannerView.h"
#import "Constants.h"
#import "BeerCategoryCollectionViewCell.h"
#import "BeerMiniListTableViewCell.h"
#import "RealBeerDataManager.h"
#import "MockBeerDataManager.h"
#import "CategoryDataManager.h"
#import "ListSegmentedControl.h"
#import "BeerDetailViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BeerHomeViewController : ViewController <UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;

@end

NS_ASSUME_NONNULL_END
