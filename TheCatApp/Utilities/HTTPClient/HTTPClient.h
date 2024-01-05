//
//  HTTPClient.h
//  TheCatApp
//
//  Created by Nick Shcherbakov on 04.01.2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTTPClient : NSObject

- (void)getPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(void(^)(NSHTTPURLResponse *response, id responseObject)) success
        failure:(void(^)(NSHTTPURLResponse *response, NSError *error))failure;
@end

NS_ASSUME_NONNULL_END
