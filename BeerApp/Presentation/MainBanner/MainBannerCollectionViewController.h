//
//  MainBannerCollectionViewController.h
//  BeerApp
//
//  Created by 지혜 on 2023/06/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainBannerCollectionViewController : UICollectionViewController

@property (nonatomic, strong) NSArray<UIImage*> *images;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

NS_ASSUME_NONNULL_END
