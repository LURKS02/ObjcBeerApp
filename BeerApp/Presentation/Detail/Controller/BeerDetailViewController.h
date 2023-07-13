//
//  BeerDetailViewController.h
//  BeerApp
//
//  Created by 지혜 on 2023/07/12.
//

#import "ViewController.h"
#import "RealBeerDataManager.h"
#import "Beer.h"

NS_ASSUME_NONNULL_BEGIN

@interface BeerDetailViewController : ViewController

@property NSInteger beerID;

@property (weak, nonatomic) IBOutlet UIImageView *beerImageView;
@property (weak, nonatomic) IBOutlet UILabel *beerName;
@property (weak, nonatomic) IBOutlet UILabel *beerTagline;
@property (weak, nonatomic) IBOutlet UILabel *beerFirstBrewed;
@property (weak, nonatomic) IBOutlet UILabel *beerDescription;

@end

NS_ASSUME_NONNULL_END
