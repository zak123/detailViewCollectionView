//
//  MasterViewController.m
//  detailViewCollectionView
//
//  Created by Zachary Mallicoat on 3/28/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "SongHeaderViewCollectionReusableView.h"
#import "SongCollectionViewCell.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController {
    UICollectionViewFlowLayout *bigLayout;
    UICollectionViewFlowLayout *smallLayout;
    UICollectionReusableView *reusuableView;
    NSString *headerText;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    bigLayout = [[UICollectionViewFlowLayout alloc] init];
    smallLayout = [[UICollectionViewFlowLayout alloc] init];
    
    
    // Small 
    smallLayout.itemSize = CGSizeMake(100,100);
    smallLayout.headerReferenceSize = CGSizeMake(100, 50);

    bigLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    bigLayout.itemSize = CGSizeMake(300,300);
    

    _popSongArray = [[NSMutableArray alloc] init];
    _rockSongArray = [[NSMutableArray alloc] init];
    _songArray = [[NSArray alloc] init];
    
    Song *song = [[Song alloc] initWithTitle:@"baby" Artist:@"justin bieber" Image:[UIImage imageNamed:@"justin_bieber"]];
    [_popSongArray addObject:song];
    
    song = [[Song alloc] initWithTitle:@"bad song 2" Artist:@"badartist2" Image:[UIImage imageNamed:@"badImage2"]];
    [_popSongArray addObject:song];
    
    song = [[Song alloc] initWithTitle:@"rock song 1" Artist:@"rock artist 1" Image:[UIImage imageNamed:@"phish"]];
    
    [_rockSongArray addObject:song];
    
    song = [[Song alloc] initWithTitle:@"rock song 2" Artist:@"rock artist 2" Image:[UIImage imageNamed:@"badImage2"]];
    [_rockSongArray addObject:song];
    
    _songArray = [NSArray arrayWithObjects:_rockSongArray, _popSongArray, nil];
    

    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    Song *song = [[self.songArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    SongCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"songCell" forIndexPath:indexPath];
    
    [cell.cellImageView setImage:song.image];
    
    return cell;
}



- (IBAction)layoutChangePressed:(id)sender {
    
    if (self.collectionView.collectionViewLayout != bigLayout) {
        [UIView animateWithDuration:0.3 animations:^{
            self.navigationItem.leftBarButtonItem.title = @"Small";
            [self.collectionView setCollectionViewLayout:bigLayout];
            [self.collectionView layoutIfNeeded];
        }];
        
        
    }
    
    else {
        
        [UIView animateWithDuration:0.3 animations:^{
            
            self.navigationItem.leftBarButtonItem.title = @"Cover Flow";
            [self.collectionView setCollectionViewLayout:smallLayout];
            [self.collectionView layoutIfNeeded];
            
        }];
    
    
    }
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        DetailViewController *detailVC = (DetailViewController *)segue.destinationViewController;
        
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
        
        Song *selectedSong = [[self.songArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
        
        detailVC.detailItem = selectedSong;
        
        
    }
}

#pragma mark - Table View
-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    
    
    if (kind == UICollectionElementKindSectionHeader) {
        SongHeaderViewCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        
        if (indexPath.section == 0) {
            
            headerText = @"Rock Music";
            
        }
        if (indexPath.section >= 1) {
            headerText = @"Pop Music";
        }
        
        headerView.title.text = headerText;
        
        
        
        reusuableView = headerView;
        
    }
    return reusuableView;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[_songArray objectAtIndex:section] count];
}


-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [_songArray count];
}


@end