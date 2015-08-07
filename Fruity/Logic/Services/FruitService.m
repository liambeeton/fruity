//
//  FruitService.m
//  Fruity
//
//  Created by Liam Beeton on 04/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#import "FruitService.h"
#import "Fruit.h"

#define kFruitDataUrl @"https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/data.json"
#define kFruitDataKey @"fruit"

@implementation FruitService

- (NSArray *)allFruit {
    NSURL *url = [NSURL URLWithString:kFruitDataUrl];
    NSData *jsonData = [NSData dataWithContentsOfURL:url];
    if (jsonData) {
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
        NSArray *jsonArray = [jsonDict objectForKey:kFruitDataKey];
        NSMutableArray *fruitArray = [[NSMutableArray alloc] init];
        for (id object in jsonArray) {
            Fruit *fruit = [[Fruit alloc] initWithPrice:object[@"price"]
                                                   type:object[@"type"]
                                                 weight:[object[@"weight"] doubleValue]];
            [fruitArray addObject:fruit];
        }
        return [fruitArray copy];
    }
    return @[];
}

@end
