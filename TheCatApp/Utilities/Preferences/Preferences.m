//
//  Preferences.m
//  TheCatApp
//
//  Created by Nick Shcherbakov on 05.01.2024.
//

#import "Preferences.h"

NSString * const kPreferncesLimit = @"limit";

@implementation Preferences

#pragma mark - Life Cycle
+ (Preferences *)shared {
    static Preferences *sharedObject = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedObject = [self new];
    });
    return sharedObject;
}

- (NSUserDefaults*)defaults {
    return [NSUserDefaults standardUserDefaults];
}

#pragma mark - Settings
- (void)setLimit:(NSInteger)limit {
    [self.defaults setInteger:limit forKey:kPreferncesLimit];
}

- (NSInteger)limit {
    NSInteger limit = [self.defaults integerForKey:kPreferncesLimit];
    if (limit <= 0) {
        limit = 10; //default value
    }
    if (limit > 100) {
        limit = 100; //Max value for limit
    }
    return limit;
}
@end
