//
//  Review.h
//  RottenMangoes
//
//  Created by Oliver Andrews on 2015-05-28.
//  Copyright (c) 2015 Oliver Andrews. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Review : NSObject

@property (nonatomic, strong) NSString *quote;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
