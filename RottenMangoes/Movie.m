//
//  Movie.m
//  RottenMangoes
//
//  Created by Oliver Andrews on 2015-05-27.
//  Copyright (c) 2015 Oliver Andrews. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.title = dict[@"title"];
        self.year = [dict[@"year"] intValue];
        self.mpaaRating = dict[@"mpaa_rating"];
        self.runtime = [dict[@"runtime"] intValue];
        self.releaseDateInTheatre = dict[@"release_dates"][@"theater"];
        self.synopsis = dict[@"synopsis"];
        self.thumbnailURL = dict[@"posters"][@"thumbnail"];
        self.reviewsURL = [dict[@"links"][@"reviews"] stringByAppendingString:@"?apikey=sr9tdu3checdyayjz85mff8j&page_limit=3"];
        self.alternateURL = dict[@"links"][@"alternate"];
    }
    return self;
}

@end
