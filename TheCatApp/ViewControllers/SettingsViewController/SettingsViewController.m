//
//  SettingsViewController.m
//  TheCatApp
//
//  Created by Nick Shcherbakov on 04.01.2024.
//

#import "SettingsViewController.h"
#import "Preferences.h"

@interface SettingsViewController () <UITextFieldDelegate>
@property (nonatomic, weak) IBOutlet UITextField* limitField;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.limitField setText:[NSString stringWithFormat:@"%ld", (long)Preferences.shared.limit]];
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [Preferences.shared setLimit:[textField.text intValue]];
}
@end
