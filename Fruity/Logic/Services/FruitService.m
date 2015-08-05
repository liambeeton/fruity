//
//  FruitService.m
//  Fruity
//
//  Created by Liam Beeton on 04/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#import "FruitService.h"

#define kFruitDataUrl @"https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/data.json"
#define kFruitDataKey @"fruit"

@implementation FruitService

- (NSArray *)allFruits {
    NSURL *url = [NSURL URLWithString:kFruitDataUrl];
    NSData *jsonData = [NSData dataWithContentsOfURL:url];
    
    if (jsonData) {
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
        return [jsonDict objectForKey:kFruitDataKey];
    }
    
    return @[];
}

@end
