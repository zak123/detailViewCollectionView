//
//  MasterViewController.m
//  detailViewCollectionView
//
//  Created by Zachary Mallicoat on 3/28/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "SongCollectionViewCell.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    _songArray = [[NSMutableArray alloc] init];
    
    Song *song = [[Song alloc] initWithTitle:@"baby" Artist:@"justin bieber" Image:[UIImage imageNamed:@"justin_bieber"]];
    [_songArray addObject:song];
    
    song = [[Song alloc] initWithTitle:@"bad song 2" Artist:@"badartist2" Image:[UIImage imageNamed:@"badimage2"]];
    [_songArray addObject:song];

    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    Song *song = [self.songArray objectAtIndex:indexPath.row];
    
    SongCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"songCell" forIndexPath:indexPath];
    
    [cell.cellImageView setImage:song.image];
    
    
    return cell;
}
-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    [self performSegueWithIdentifier:@"showDetail" sender:collectionView];
}



#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        DetailViewController *detailVC = (DetailViewController *)segue.destinationViewController;
        
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        
        Song *selectedSong = self.songArray[indexPath.row];
        
        detailVC.detailItem = selectedSong;
        
        
    }
}

#pragma mark - Table View
-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.songArray.count;
}


-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


@end