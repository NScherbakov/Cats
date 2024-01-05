//
//  DetailsViewController.m
//  TheCatApp
//
//  Created by Nick Shcherbakov on 04.01.2024.
//

#import "DetailsViewController.h"
#import "DetailsViewCell.h"
#import "NetworkManager.h"
#import "Breed.h"

NSString* const kDetailViewCellReusableIdentifier = @"DetailViewCellIdentifier";
NSInteger const kDetailValueLabelWidth = 170.0f;
NSInteger const kDetailCellPadding = 10.0f;

typedef NS_ENUM(NSInteger, BreedValueType) {
    BreedValueTemperamentType, // Default: 0
    BreedValueOriginType,
    BreedValueDescriptionType,
    BreedValueLifespanType,
    BreedValueTypeCount
};

@interface DetailsViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UIImageView* imageView;
@property (nonatomic, weak) IBOutlet UILabel* breedLabel;
@property (nonatomic, weak) IBOutlet UITableView* tableView;

@property (nonatomic, strong) CatImage* model;
@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = 600.0 ;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self updateUI];
}

#pragma mark - Public section
- (void)configureVithModel:(CatImage *)model {
    _model = model;
}

#pragma  mark - Private section
- (void)updateUI {
    self.breedLabel.text = [self.model breedName];
    __weak typeof(self) weakSelf = self;
    [NetworkManager.manager imageCachedWithURL:self.model.url withComplition:^(UIImage * _Nullable image) {
        if (image != nil) {
            [weakSelf.imageView setImage:image];
        }
    }];
}

- (NSString*)titleWithBreedValueType:(BreedValueType)type {
    NSString* strRet = @"";
    switch(type) {
        case BreedValueTemperamentType:
            strRet = NSLocalizedString(@"Temperament:", nil);
            break;
        case BreedValueOriginType:
            strRet = NSLocalizedString(@"Origin:", nil);
            break;
        case BreedValueDescriptionType:
            strRet = NSLocalizedString(@"Description:", nil);
            break;
        case BreedValueLifespanType:
            strRet = NSLocalizedString(@"Lifespan:", nil);
            break;
        default:
            break;
    }
    return strRet;
}

- (NSString*)valueWithBreedValueType:(BreedValueType)type {
    NSString* strRet = @"";
    Breed* breed = self.model.breed;
    if (breed != nil) {
        switch (type){
            case BreedValueTemperamentType:
                strRet = breed.temperament;
                break;
            case BreedValueOriginType:
                strRet = breed.origin;
                break;
            case BreedValueDescriptionType:
                strRet = breed.theDescription;
                break;
            case BreedValueLifespanType:
                strRet = breed.lifeSpan;
                break;
            default:
                break;
        }}
    return strRet;
}

#pragma mark - UITableViewDelegate/UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailsViewCell *cell =(DetailsViewCell*)[tableView dequeueReusableCellWithIdentifier:kDetailViewCellReusableIdentifier forIndexPath:indexPath];
    cell.nameLabel.text = [self titleWithBreedValueType:indexPath.row];
    cell.valueLabel.text = [self valueWithBreedValueType:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return BreedValueTypeCount;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* str = [self valueWithBreedValueType:indexPath.row];
    CGFloat height = [self heightWithString:str andWidth:kDetailValueLabelWidth];
    return height + kDetailCellPadding;
}

- (CGFloat)heightWithString:(NSString*)string andWidth:(CGFloat)width {
    CGSize constraint = CGSizeMake(width, INFINITY);
    NSDictionary* attrs = @{NSFontAttributeName: [UIFont systemFontOfSize:17]};
    CGRect newBounds = [string boundingRectWithSize:constraint
                                          options:NSLineBreakByWordWrapping | NSStringDrawingUsesLineFragmentOrigin
                                       attributes:attrs
                                            context:nil];
    return newBounds.size.height;
}

@end
