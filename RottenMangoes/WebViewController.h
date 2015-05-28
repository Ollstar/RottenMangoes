//
//  WebViewController.h
//  RottenMangoes
//
//  Created by Oliver Andrews on 2015-05-28.
//  Copyright (c) 2015 Oliver Andrews. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (nonatomic) NSURL* url;

@end
