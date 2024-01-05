//
//  MainViewController.m
//  TheCatApp
//
//  Created by Nick Shcherbakov on 04.01.2024.
//

#import "MainViewController.h"
#import "DetailsViewController.h"
#import "MainViewCell.h"
#import "NetworkManager.h"

@import MBProgressHUD;

NSString* const kMainViewCellReusableIdentifier = @"MainViewCellIdentifier";

@interface MainViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UITableView* tableView;
@property (nonatomic, strong) NSArray* images;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.refreshControl = [UIRefreshControl new];
    [self.tableView.refreshControl addTarget:self action:@selector(updateUI) forControlEvents:UIControlEventValueChanged];
    
    [self updateUI];
}

#pragma mark - UITableViewDelegate/UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.images.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainViewCell *cell =(MainViewCell*)[tableView dequeueReusableCellWithIdentifier:kMainViewCellReusableIdentifier forIndexPath:indexPath];
    [cell configureWithModel:[self.images objectAtIndex:indexPath.row]];
    return cell;
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController* vc = [segue destinationViewController];
    if (vc != nil) {
        if ([vc isKindOfClass:DetailsViewController.class] == YES) {
            DetailsViewController* detailsVC = (DetailsViewController*)vc;
            NSInteger row = self.tableView.indexPathForSelectedRow.row;
            if (row >= 0 && row < self.images.count) {
                [detailsVC configureVithModel:[self.images objectAtIndex:row]];
            }
        }
    }
}

#pragma mark - Actions
- (IBAction)refreshData:(id)sender {
    [self updateUI];
}

#pragma mark - Private section
- (void)updateUI {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    __weak typeof(self) weakSelf = self;
    [NetworkManager.manager catImagesWithCompletion:^(NSArray * _Nonnull images, NSError* error) {
        weakSelf.images = images;
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
            [weakSelf.tableView.refreshControl endRefreshing];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    }];
}
@end
