//
//  MainBannerViewController.h
//  BeerApp
//
//  Created by 지혜 on 2023/06/23.
//

#import <UIKit/UIKit.h>
#import "MainBannerPageControl.h"
#import "MainBannerCollectionView.h"
#import "MainBannerCollectionViewCell.h"
#import "MainBannerImageDataProvider.h"
#import "BannerFlowLayout.h"

@interface MainBannerView : UIView <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) BannerFlowLayout *layout;
@property (nonatomic, strong) MainBannerImageDataProvider *imageDataProvider;
@property (nonatomic, strong) MainBannerCollectionView *collectionView;
@property (nonatomic, strong) MainBannerPageControl *pageControl;

@end
