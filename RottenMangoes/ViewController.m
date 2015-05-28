//
//  ViewController.m
//  RottenMangoes
//
//  Created by Oliver Andrews on 2015-05-27.
//  Copyright (c) 2015 Oliver Andrews. All rights reserved.
//

#import "ViewController.h"
#import "Movie.h"
#import "MovieCollectionViewCell.h"
#import "MovieDetailViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.moviesList = [NSMutableArray array];
    //
    [self fetchData];
    
}

- (void)fetchData {
    // 1
    NSURL *URL = [NSURL URLWithString:@"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/in_theaters.json?apikey=sr9tdu3checdyayjz85mff8j&page_limit=50"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *task = [[NSURLSession  sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if (!error && httpResponse.statusCode == 200) {
            NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: nil];
            NSMutableArray *myMovieArray = [JSON objectForKey:@"movies"];
            for (NSDictionary *myDict in myMovieArray)
            {
                Movie *thisMovie = [[Movie alloc ]initWithDictionary:myDict] ;
                [self.moviesList addObject:thisMovie];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.collectionView reloadData];
            });
        }
    }];
    [task resume];

//    [NSURLConnection sendAsynchronousRequest:request
//                                       queue:[NSOperationQueue mainQueue]
//                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
//                               // ...
//                               NSLog(@"got data 2");
//                               NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: nil];
//                               NSMutableArray *myMovieArray = [JSON objectForKey:@"movies"];
//                               for (NSDictionary *myDict in myMovieArray)
//                               {
//                                   Movie *thisMovie = [[Movie alloc ]initWithDictionary:myDict] ;
//                                   [self.moviesList addObject:thisMovie];
//                               }
//                               [self.collectionView reloadData];
//                           }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.moviesList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MovieCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell
    Movie *movieObject = self.moviesList[indexPath.item];
    [cell fetchImage:movieObject];
    cell.label.text = movieObject.title;

    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        MovieDetailViewController *mdvc = segue.destinationViewController;
        NSIndexPath *indexPath = [[self.collectionView indexPathsForSelectedItems] firstObject];
        mdvc.movieObject = self.moviesList[indexPath.row];
    }
}

@end
