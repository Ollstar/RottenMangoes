//
//  Review.m
//  RottenMangoes
//
//  Created by Oliver Andrews on 2015-05-28.
//  Copyright (c) 2015 Oliver Andrews. All rights reserved.
//

#import "Review.h"

@implementation Review

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.quote = dict[@"quote"];

    }
    return self;
}

@end
