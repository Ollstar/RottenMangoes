//
//  Movie.h
//  RottenMangoes
//
//  Created by Oliver Andrews on 2015-05-27.
//  Copyright (c) 2015 Oliver Andrews. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) int year;
@property (nonatomic, strong) NSString *mpaaRating;
@property (nonatomic, assign) int runtime;
@property (nonatomic, strong) NSString *releaseDateInTheatre;
@property (nonatomic, strong) NSString *synopsis;
@property (nonatomic, strong) NSString *thumbnailURL;
@property (nonatomic, strong) UIImage *thumbnailImage;
@property (nonatomic, strong) NSString *reviewsURL;
@property (nonatomic, strong) NSArray *reviewsArray;
@property (nonatomic, strong) NSString *alternateURL;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
