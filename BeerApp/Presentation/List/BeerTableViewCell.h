//
//  BeerTableViewCell.h
//  BeerApp
//
//  Created by 지혜 on 2023/06/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BeerTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *beerImageView;
@property (weak, nonatomic) IBOutlet UILabel *beerName;
@property (weak, nonatomic) IBOutlet UILabel *beerTagline;
@property (weak, nonatomic) IBOutlet UILabel *beerFirstBrewed;
@property (weak, nonatomic) IBOutlet UILabel *beerDescription;

@end

NS_ASSUME_NONNULL_END
