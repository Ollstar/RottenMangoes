//
//  MovieDetailViewController.h
//  RottenMangoes
//
//  Created by Oliver Andrews on 2015-05-27.
//  Copyright (c) 2015 Oliver Andrews. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Movie;

@interface MovieDetailViewController : UITableViewController

@property (nonatomic) Movie *movieObject;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *webButton;


@end
