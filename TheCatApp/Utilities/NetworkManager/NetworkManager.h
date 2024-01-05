//
//  NetworkManager.h
//  TheCatApp
//
//  Created by Nick Shcherbakov on 04.01.2024.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject
@property (class, readonly) NetworkManager *manager;

- (void)catImagesWithCompletion:(void(^)(NSArray *image, NSError* error))completion;
- (void)imageCachedWithURL:(NSString*)path withComplition:(nullable void(^)(UIImage* _Nullable image)) completeon;
@end

NS_ASSUME_NONNULL_END
