//
//  MasterViewController.h
//  detailViewCollectionView
//
//  Created by Zachary Mallicoat on 3/28/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Song.h"
#import "iCarousel.h"

@interface MasterViewController : UICollectionViewController
@property (strong, nonatomic) IBOutlet UIBarButtonItem *changeView;

@property (nonatomic, strong) NSMutableArray *popSongArray;
@property (nonatomic, strong) NSMutableArray *rockSongArray;
@property (nonatomic, strong) NSArray *songArray;

@property (strong, nonatomic) IBOutlet UICollectionViewCell *songsCollectionView;


@end

