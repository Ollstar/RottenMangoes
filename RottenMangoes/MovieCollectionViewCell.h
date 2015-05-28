//
//  MovieCollectionViewCell.h
//  RottenMangoes
//
//  Created by Oliver Andrews on 2015-05-27.
//  Copyright (c) 2015 Oliver Andrews. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Movie;

@interface MovieCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (strong, nonatomic) NSURLSessionDownloadTask *downloadImageTask;

- (void)fetchImage:(Movie *)movie;

@end
