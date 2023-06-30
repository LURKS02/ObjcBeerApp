//
//  MainBannerViewController.h
//  BeerApp
//
//  Created by 지혜 on 2023/06/23.
//

#import <UIKit/UIKit.h>
#import "MainBannerCollectionView.h"
#import "MainBannerCollectionViewCell.h"
#import "MainBannerImageDataProvider.h"
#import "BannerFlowLayout.h"
#import "LinePageControl.h"
#import "BannerTimer.h"

@interface MainBannerView : UIView <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) BannerFlowLayout *layout;
@property (nonatomic, strong) MainBannerImageDataProvider *imageDataProvider;
@property (nonatomic, strong) MainBannerCollectionView *collectionView;
@property (nonatomic, strong) LinePageControl *linePageControl;


- (void)timerScrollToNextPage;
- (CGFloat)getWidth;
- (CGFloat)getHeight;

@end
