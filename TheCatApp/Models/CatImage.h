//
//  CatImage.h
//  TheCatApp
//
//  Created by Nick Shcherbakov on 04.01.2024.
//

#import <Foundation/Foundation.h>
#import "Breed.h"

NS_ASSUME_NONNULL_BEGIN

@interface CatImage : NSObject
@property (nonatomic, copy)   NSArray<Breed *> *breeds;
@property (nonatomic, copy)   NSString *identifier;
@property (nonatomic, copy)   NSString *url;
@property (nonatomic, assign) NSInteger width;
@property (nonatomic, assign) NSInteger height;

- (NSString*)breedName;
- (Breed*)breed;
@end

NS_ASSUME_NONNULL_END
