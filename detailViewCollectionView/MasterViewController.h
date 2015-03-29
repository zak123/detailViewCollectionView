//
//  MasterViewController.h
//  detailViewCollectionView
//
//  Created by Zachary Mallicoat on 3/28/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Song.h"

@interface MasterViewController : UICollectionViewController

@property (nonatomic, strong) NSMutableArray *songArray;

@property (strong, nonatomic) IBOutlet UICollectionViewCell *songsCollectionView;


@end

