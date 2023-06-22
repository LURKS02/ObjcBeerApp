//
//  BeerTableViewController.h
//  BeerApp
//
//  Created by 지혜 on 2023/06/21.
//

#import <UIKit/UIKit.h>
#import "BeerDataManagerProtocol.h"
#import "RealBeerDataManager.h"
#import "MockBeerDataManager.h"
#import "BeerTableViewCell.h"
#import "Constants.h"

NS_ASSUME_NONNULL_BEGIN

@interface BeerTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) id<BeerDataManagerProtocol> beerDataManager;

@end

NS_ASSUME_NONNULL_END
