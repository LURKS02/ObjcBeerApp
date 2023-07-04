//
//  BeerCategoryCollectionView.m
//  BeerApp
//
//  Created by 지혜 on 2023/07/03.
//

#import "BeerCategoryCollectionView.h"

@implementation BeerCategoryCollectionView

- (id)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout categorys:(NSArray *)categorys{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.categorys = categorys;
        self.delegate = self;
        self.dataSource = self;
        
        UINib *nib = [UINib nibWithNibName:@"BeerCategoryCollectionViewCell" bundle:nil];
        [self registerNib: nib forCellWithReuseIdentifier:@"beerCategory"];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.categorys.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    BeerCategoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"beerCategory" forIndexPath:indexPath];
    BeerCategory *category = [self.categorys objectAtIndex:indexPath.row];
    UIImage *image = [UIImage imageNamed:category.categoryImage];
    [cell.beerCategoryImageView setImage:image];
    [cell.beerCategoryLabel setText:category.categoryName];
    return cell;
}

@end
