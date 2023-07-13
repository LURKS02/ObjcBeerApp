//
//  BeerDetailViewController.m
//  BeerApp
//
//  Created by 지혜 on 2023/07/12.
//

#import "BeerDetailViewController.h"

@interface BeerDetailViewController ()


#pragma mark - Properties

@property Beer* beer;

@end


#pragma mark - Static Variables

@implementation BeerDetailViewController

#pragma mark - Class Methods


#pragma mark - View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}


#pragma mark - Configuration Data

- (void)configureData {
    
    [self setupBeer: _beerID];
    
}

- (void)setupBeer:(NSInteger)beerID {
    [RealBeerDataManager.sharedInstance fetchBeer:beerID completion:^(Beer * _Nonnull beer, NSError * _Nonnull error) {
        if (error) {
            NSLog(@"Error: &@", error);
        } else {
            self.beer = beer;
            dispatch_async(dispatch_get_main_queue(), ^{
                //
            });
        }
    }];
}



#pragma mark - UI Settings

- (void)setup {
    
    [self configureData];
    
}


#pragma mark - Register NIB



#pragma mark - Actions


#pragma mark - Functions


@end
