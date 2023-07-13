//
//  BeerNavigationController.m
//  BeerApp
//
//  Created by 지혜 on 2023/07/13.
//

#import "BeerNavigationController.h"

@interface BeerNavigationController ()

@end

@implementation BeerNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - initialize

- (void)setupNavigationBarTheme {
    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
    [appearance configureWithOpaqueBackground];
    [appearance setBackgroundColor:[UIColor whiteColor]];
    
    NSDictionary<NSAttributedStringKey, id> *titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor], NSFontAttributeName : [UIFont boldSystemFontOfSize:15] };
    appearance.titleTextAttributes = titleTextAttributes;
    
    //self.navigationBar.standardAppearance = appearance;
    self.navigationBar.scrollEdgeAppearance = appearance;
}

@end
