//
//  Song.h
//  detailViewCollectionView
//
//  Created by Zachary Mallicoat on 3/28/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Song : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *artist;
@property (nonatomic, strong) UIImage *image;

- (instancetype)initWithTitle:(NSString *)title Artist:(NSString *)artist Image:(UIImage *)image;
@end
