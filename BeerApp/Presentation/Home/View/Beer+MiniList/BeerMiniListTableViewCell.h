//
//  BeerMiniListTableViewCell.h
//  BeerApp
//
//  Created by 지혜 on 2023/07/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BeerMiniListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *beerImageView;
@property (weak, nonatomic) IBOutlet UILabel *beerName;
@property (weak, nonatomic) IBOutlet UILabel *beerTagline;
@property (weak, nonatomic) IBOutlet UILabel *beerFirstBrewed;

@end

NS_ASSUME_NONNULL_END
