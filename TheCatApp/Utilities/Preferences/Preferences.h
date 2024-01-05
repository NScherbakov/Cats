//
//  Preferences.h
//  TheCatApp
//
//  Created by Nick Shcherbakov on 05.01.2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Preferences : NSObject
@property (class, readonly) Preferences *shared;

@property (nonatomic, assign) NSInteger limit;
@end

NS_ASSUME_NONNULL_END
