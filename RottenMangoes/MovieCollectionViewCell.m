//
//  MovieCollectionViewCell.m
//  RottenMangoes
//
//  Created by Oliver Andrews on 2015-05-27.
//  Copyright (c) 2015 Oliver Andrews. All rights reserved.
//

#import "MovieCollectionViewCell.h"
#import "Movie.h"

@implementation MovieCollectionViewCell

-(void) prepareForReuse {
    [self.downloadImageTask cancel];
}

- (void)fetchImage:(Movie *)movie{
    NSURL *url = [NSURL URLWithString:movie.thumbnailURL];
    self.downloadImageTask = [[NSURLSession sharedSession] downloadTaskWithURL:url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        
        UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL:location]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.thumbnailImageView.image = image;
            movie.thumbnailImage = image;
        });
        
    }];
    [self.downloadImageTask resume];
}

@end
