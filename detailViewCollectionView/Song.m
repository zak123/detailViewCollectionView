//
//  Song.m
//  detailViewCollectionView
//
//  Created by Zachary Mallicoat on 3/28/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "Song.h"

@implementation Song

- (instancetype)initWithTitle:(NSString *)title Artist:(NSString *)artist Image:(UIImage *)image
{
    self = [super init];
    if (self) {
        _artist = artist;
        _title = title;
        _image = image;
    }
    return self;
}

@end
