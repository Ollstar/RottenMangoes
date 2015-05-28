//
//  HeaderTableViewCell.h
//  
//
//  Created by Oliver Andrews on 2015-05-28.
//
//

#import <UIKit/UIKit.h>

@interface HeaderTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleAndYearLabel;
@property (weak, nonatomic) IBOutlet UILabel *mmpaRatingLabel;
@property (weak, nonatomic) IBOutlet UILabel *runtimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *releaseDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;

@end
