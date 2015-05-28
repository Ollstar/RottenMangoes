//
//  MovieDetailViewController.m
//  RottenMangoes
//
//  Created by Oliver Andrews on 2015-05-27.
//  Copyright (c) 2015 Oliver Andrews. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "Movie.h"
#import "Review.h"
#import "HeaderTableViewCell.h"
#import "ReviewTableViewCell.h"
#import "WebViewController.h"

@interface MovieDetailViewController ()

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.    
    [self fetchReviews];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchReviews {
    NSURL *url = [NSURL URLWithString:self.movieObject.reviewsURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (!error && httpResponse.statusCode == 200) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            NSMutableArray *detailReviewsArray = [NSMutableArray array];
            self.movieObject.reviewsArray = dict[@"reviews"];
            for (NSDictionary *myDict in self.movieObject.reviewsArray)       {
                Review *thisReview = [[Review alloc ]initWithDictionary:myDict];
                [detailReviewsArray addObject:thisReview];
            }
            self.movieObject.reviewsArray = detailReviewsArray;

            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }
    }];
    [task resume];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0) {
        return 1;
    }
    return self.movieObject.reviewsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *HeaderIdentifier = @"Header";
    static NSString *ReviewIdentifier = @"Review";

    if (indexPath.section == 0) {
        HeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HeaderIdentifier forIndexPath:indexPath];
        self.title = self.movieObject.title;
        //    self.moreButton.layer.cornerRadius = 10.0f;
        cell.titleAndYearLabel.text = [[[self.movieObject.title stringByAppendingString:@" ("] stringByAppendingString:[NSString stringWithFormat:@"%d", self.movieObject.year]] stringByAppendingString:@")"];
        cell.mmpaRatingLabel.text = self.movieObject.mpaaRating;
        cell.mmpaRatingLabel.clipsToBounds = YES;
        cell.mmpaRatingLabel.layer.cornerRadius = 5.0f;
        cell.runtimeLabel.text = [NSString stringWithFormat:@"%d mins", self.movieObject.runtime];
        cell.releaseDateLabel.text = self.movieObject.releaseDateInTheatre;
        cell.synopsisLabel.text = self.movieObject.synopsis;
        cell.thumbnailImageView.image = self.movieObject.thumbnailImage;
        return cell;
    } else {
        ReviewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ReviewIdentifier forIndexPath:indexPath];
        Review *reviewItem = self.movieObject.reviewsArray[indexPath.row];
        cell.reviewLabel.text = reviewItem.quote;

    return cell;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"viewWeb"]){
//        NSIndexPath* indexPath = [[self.tableView indexPathsForSelectedRows]firstObject];
        WebViewController *controller = segue.destinationViewController;
        controller.url = [NSURL URLWithString:self.movieObject.alternateURL];
    }
}

@end
