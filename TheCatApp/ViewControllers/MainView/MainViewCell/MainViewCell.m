//
//  MainViewCell.m
//  TheCatApp
//
//  Created by Nick Shcherbakov on 04.01.2024.
//

#import "MainViewCell.h"
#import "NetworkManager.h"

@interface MainViewCell ()
@property (nonatomic, weak) IBOutlet UILabel* breedLabel;
@property (nonatomic, weak) IBOutlet UIImageView* thumbnailView;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView* activityView;

@property (nonatomic, strong) CatImage* model;
@end

@implementation MainViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - Public section
- (void)configureWithModel:(CatImage *)model {
    _model = model;
    [self updateUI];
}

#pragma mark - Private section
- (void)updateUI {
    [self.activityView startAnimating];
    self.breedLabel.text = [self.model breedName];
    [self.thumbnailView setImage:nil];
    __weak typeof(self) weakSelf = self;
    [NetworkManager.manager imageCachedWithURL:self.model.url withComplition:^(UIImage * _Nullable image) {
        if (image != nil) {
            [weakSelf.thumbnailView setImage:image];
        }
        [weakSelf.activityView stopAnimating];
    }];
}
@end
