//
//  Breed.h
//  TheCatApp
//
//  Created by Nick Shcherbakov on 04.01.2024.
//

#import <Foundation/Foundation.h>
#import "Weight.h"

NS_ASSUME_NONNULL_BEGIN

@interface Breed : NSObject
@property (nonatomic, strong) Weight *weight;
@property (nonatomic, copy)   NSString *identifier;
@property (nonatomic, copy)   NSString *name;
@property (nonatomic, copy)   NSString *cfaURL;
@property (nonatomic, copy)   NSString *vetstreetURL;
@property (nonatomic, copy)   NSString *vcahospitalsURL;
@property (nonatomic, copy)   NSString *temperament;
@property (nonatomic, copy)   NSString *origin;
@property (nonatomic, copy)   NSString *countryCodes;
@property (nonatomic, copy)   NSString *countryCode;
@property (nonatomic, copy)   NSString *theDescription;
@property (nonatomic, copy)   NSString *lifeSpan;
@property (nonatomic, assign) NSInteger indoor;
@property (nonatomic, copy)   NSString *altNames;
@property (nonatomic, assign) NSInteger adaptability;
@property (nonatomic, assign) NSInteger affectionLevel;
@property (nonatomic, assign) NSInteger childFriendly;
@property (nonatomic, assign) NSInteger dogFriendly;
@property (nonatomic, assign) NSInteger energyLevel;
@property (nonatomic, assign) NSInteger grooming;
@property (nonatomic, assign) NSInteger healthIssues;
@property (nonatomic, assign) NSInteger intelligence;
@property (nonatomic, assign) NSInteger sheddingLevel;
@property (nonatomic, assign) NSInteger socialNeeds;
@property (nonatomic, assign) NSInteger strangerFriendly;
@property (nonatomic, assign) NSInteger vocalisation;
@property (nonatomic, assign) NSInteger experimental;
@property (nonatomic, assign) NSInteger hairless;
@property (nonatomic, assign) NSInteger natural;
@property (nonatomic, assign) NSInteger rare;
@property (nonatomic, assign) NSInteger rex;
@property (nonatomic, assign) NSInteger suppressedTail;
@property (nonatomic, assign) NSInteger shortLegs;
@property (nonatomic, copy)   NSString *wikipediaURL;
@property (nonatomic, assign) NSInteger hypoallergenic;
@property (nonatomic, copy)   NSString *referenceImageID;
@end

NS_ASSUME_NONNULL_END
