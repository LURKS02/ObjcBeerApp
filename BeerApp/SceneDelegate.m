//
//  SceneDelegate.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/21.
//

#import "SceneDelegate.h"
#import "AppDelegate.h"
#import "BeerHomeViewController.h"
#import "BeerNavigationController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene*) scene];
    BeerHomeViewController *rootViewController = [[BeerHomeViewController alloc] init];
    BeerNavigationController *navigationController = [[BeerNavigationController alloc]initWithRootViewController:rootViewController];
    self.window.rootViewController = navigationController;
    
    [self configureNavigationBarAppearance];
    
    [self.window makeKeyAndVisible];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    
}


- (void)sceneWillResignActive:(UIScene *)scene {
    
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    
    [(AppDelegate *)UIApplication.sharedApplication.delegate saveContext];
}


#pragma mark - UI Settings

- (void)configureNavigationBarAppearance {
    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
    [appearance configureWithTransparentBackground];
    
    NSDictionary<NSAttributedStringKey, id> *titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor], NSFontAttributeName : [UIFont boldSystemFontOfSize:15] };
    appearance.titleTextAttributes = titleTextAttributes;
    
    [UINavigationBar appearance].standardAppearance = appearance;
    [UINavigationBar appearance].scrollEdgeAppearance = appearance;
}

@end
