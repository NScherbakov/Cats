//
//  CatImage.m
//  TheCatApp
//
//  Created by Nick Shcherbakov on 04.01.2024.
//

#import "CatImage.h"

@implementation CatImage

- (NSString*)breedName {
    NSString* ret = @"";
    if (self.breed != nil) {
        ret = self.breed.name;
    }
    return ret;
}

- (nonnull Breed *)breed {
    Breed* ret = nil;
    if (self.breeds != nil && self.breeds.count > 0) {
        ret = [self.breeds objectAtIndex:0];
    }
    return ret;
}

@end
