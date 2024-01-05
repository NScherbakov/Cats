//
//  HTTPClient.m
//  TheCatApp
//
//  Created by Nick Shcherbakov on 04.01.2024.
//

#import "HTTPClient.h"

@import AFNetworking;

const NSTimeInterval kTimeout = 10.0;

@interface HTTPClient ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation HTTPClient

#pragma mark - Life Cycle

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

#pragma mark - Public section
- (void)getPath:(NSString *)path
     parameters:(NSDictionary *)parameters
        success:(void(^)(NSHTTPURLResponse *, id))success
        failure:(void(^)(NSHTTPURLResponse *, NSError *))failure {
    
    [self.sessionManager GET:path
             parameters:parameters
                headers:nil
               progress:nil
                success:^(NSURLSessionDataTask *task, id responseObject) {
                    success((id)task.response, responseObject);
                }
                failure:^(NSURLSessionDataTask *task, NSError *error) {
                    NSLog(@"Network error: %@", error.localizedDescription);
                }];
}

#pragma mark - Private section
- (AFURLSessionManager*)sessionManager {
    if (_sessionManager == nil) {
        _sessionManager = [AFHTTPSessionManager manager];
        _sessionManager.requestSerializer.timeoutInterval = kTimeout;
    }
    return _sessionManager;
}
@end
