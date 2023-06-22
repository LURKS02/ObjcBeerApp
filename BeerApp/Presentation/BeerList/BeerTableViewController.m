//
//  BeerTableViewController.m
//  BeerApp
//
//  Created by 지혜 on 2023/06/21.
//

#import "BeerTableViewController.h"

@interface BeerTableViewController ()

@property (nonatomic, strong) NSArray<Beer *> *beers;

@end

@implementation BeerTableViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.beerDataManager fetchBeers:^(NSArray<Beer *> *beers, NSError *error) {
        if (beers) {
            self.beers = beers;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }
        else {
            NSLog(@"Error fetching beers: %@", error);
        }
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.beerDataManager = IS_MOCKUP ? [MockBeerDataManager new] : [RealBeerDataManager new];
    self.tableView.estimatedRowHeight = 500.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
}

#pragma mark - Table view data source

/*- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}*/


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.beers count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BeerTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier: @"beerTableViewCell" forIndexPath: indexPath];
    Beer* target = [self.beers objectAtIndex: indexPath.row];
    
    [self getImageFromURL:target.imageURL completion:^(UIImage *image){
        dispatch_async(dispatch_get_main_queue(), ^{
            BeerTableViewCell *updateCell = (id)[tableView cellForRowAtIndexPath: indexPath];
            if (updateCell) {
                updateCell.beerImageView.image = image;
            }
        });
    }];
    
    cell.beerName.text = target.name;
    cell.beerTagline.text = target.tagline;
    cell.beerFirstBrewed.text = target.firstBrewed;
    cell.beerDescription.text = target.beerDescription;
    
    NSLog(@"indexPath: %@", indexPath);
    NSLog(@"target: %@", target.name);
    NSLog(@"cell: %@", cell);
    
    return cell;
}

- (void)getImageFromURL:(NSURL *)url completion:(void (^)(UIImage *image))completion {
    NSURLSessionDownloadTask *downloadTask = [[NSURLSession sharedSession]
                                              dataTaskWithURL: url completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
        if (data) {
            UIImage *image = [UIImage imageWithData: data];
            completion(image);
        }
    }];
    
    [downloadTask resume];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
