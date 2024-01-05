//
//  MainViewCell.h
//  TheCatApp
//
//  Created by Nick Shcherbakov on 04.01.2024.
//

#import <UIKit/UIKit.h>
#import "CatImage.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewCell : UITableViewCell
- (void)configureWithModel:(CatImage*)model;
@end

NS_ASSUME_NONNULL_END
