//
//  BeerCategoryCollectionViewController.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/23.
//

#import "BeerCategoryCollectionViewController.h"
#import "BeerCategoryButton.h"

@interface BeerCategoryCollectionViewController ()

@end

@implementation BeerCategoryCollectionViewController

static NSString * const reuseIdentifier = @"beerCategoryCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

#pragma mark <UICollectionViewDataSource>

/*- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
#warning Incomplete implementation, return the number of sections
    return 0;
}
*/

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    BeerCategoryButton *button = [[BeerCategoryButton alloc] initWithFrame:CGRectMake(0, 0, 60, 60) image: @"bus" label: @"버스"];
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:cell.contentView.bounds];
    image.image = [UIImage imageNamed:@"bus"];
    image.contentMode = UIViewContentModeScaleAspectFit;
    
    [cell.contentView addSubview:button];
    
    
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
