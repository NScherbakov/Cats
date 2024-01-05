//
//  NetworkManager.m
//  TheCatApp
//
//  Created by Nick Shcherbakov on 04.01.2024.
//

#import "NetworkManager.h"
#import "HTTPClient.h"
#import "Preferences.h"
#import "CatImage.h"

@import OCMapper;
@import SDWebImage;

NSString* const kBaseURL = @"https://api.thecatapi.com/v1/images/search";
NSString* const kAPIKeyValue = @"live_jw89ZiaARHuyk37BrGVQBU4Qf7QOK8vIVQ9ZoUQEJwzHgzRpC0fGQkfpvNZJjCn7";
NSString* const kAPIKey = @"api_key";
NSString* const kHasBreedsKey = @"has_breeds";
NSString* const kLimitKey = @"limit";
NSString* const kServerBreedDescriptionKey = @"description";
NSString* const kModelBreedDescriptionKey = @"theDescription";

@interface NetworkManager ()
@property (nonatomic, strong) HTTPClient* httpClient;
@end

@implementation NetworkManager

#pragma mark - Life Cycle
+ (instancetype)manager {
    static id networkManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        networkManager = [[self class] new];
    });
    return networkManager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _httpClient = [HTTPClient new];
    }
    return self;
}

#pragma mark - Public section
- (void)catImagesWithCompletion:(void(^)(NSArray *image, NSError* error))completion {
    NSDictionary* parameters = @{kAPIKey: kAPIKeyValue, kHasBreedsKey: [NSNumber numberWithInt:1], kLimitKey: [NSNumber numberWithInteger:Preferences.shared.limit]};
    [self.httpClient getPath:kBaseURL
                  parameters:parameters
                     success:^(NSHTTPURLResponse * _Nonnull response, id  _Nonnull responseObject) {
        if (responseObject != nil && [responseObject isKindOfClass:[NSArray class]] == YES) {
            NSMutableArray* retArr = [NSMutableArray new];
            InCodeMappingProvider *inCodeMappingProvider = [[InCodeMappingProvider alloc] init];
            [inCodeMappingProvider mapFromDictionaryKey:kServerBreedDescriptionKey toPropertyKey:kModelBreedDescriptionKey forClass:[Breed class]];
            [[ObjectMapper sharedInstance] setMappingProvider:inCodeMappingProvider];
            for (NSDictionary* image in responseObject) {
                [retArr addObject:[CatImage objectFromDictionary:image]];
            }
            if (completion) {
                completion(retArr, nil);
            }
        }
        }
                     failure:^(NSHTTPURLResponse * _Nonnull response, NSError * _Nonnull error) {
        if (completion) {
            completion([NSArray new], error);
        }
        }];
}

- (void)imageCachedWithURL:(nonnull NSString *)path withComplition:(nullable void (^)(UIImage * _Nullable __strong))completeon {
    SDImageCache *imageCache = [[SDImageCache alloc] initWithNamespace:NSBundle.mainBundle.bundleIdentifier];
    [imageCache queryCacheOperationForKey:path done:^(UIImage *image, NSData* data, SDImageCacheType type) {
        if (image == nil) {
            SDWebImageDownloader *downloader = [SDWebImageDownloader sharedDownloader];
            [downloader downloadImageWithURL:[NSURL URLWithString:path]
                                   completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
                                        if (finished) {
                                            if (image) {
                                                [imageCache storeImage:image forKey:path completion:nil];
                                                if (completeon) {
                                                    completeon(image);
                                                }
                                            }
                                            else {
                                                if (completeon) {
                                                    completeon(nil);
                                                }
                                            }
                                        }
                                    }];
        }
        else {
            if (completeon) {
                completeon(image);
            }
        }
    }];
}

@end
