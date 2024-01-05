//
//  DetailsViewCell.h
//  TheCatApp
//
//  Created by Nick Shcherbakov on 05.01.2024.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel* nameLabel;
@property (nonatomic, weak) IBOutlet UILabel* valueLabel;
@end

NS_ASSUME_NONNULL_END
