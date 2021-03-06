//
//  DetailViewController.h
//  detailViewCollectionView
//
//  Created by Zachary Mallicoat on 3/28/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Song.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Song* detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) IBOutlet UIImageView *detailImageView;
@property (weak, nonatomic) IBOutlet UILabel *detailArtistLabel;

@end

