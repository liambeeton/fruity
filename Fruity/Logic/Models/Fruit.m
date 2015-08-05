//
//  Fruit.m
//  Fruity
//
//  Created by Liam Beeton on 04/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#import "Fruit.h"

@implementation Fruit

- (instancetype)initWithPrice:(NSDecimalNumber *)price
                         type:(NSString *)type
                       weight:(NSUInteger)weight {
    self = [super init];
    if (self) {
        _price = [price copy];
        _type = [type copy];
        _weight = weight;
    }
    return self;
}

- (BOOL)isEqual:(id)obj {
    if(![obj isKindOfClass:[Fruit class]]) return NO;

    Fruit *other = (Fruit *)obj;
    
    BOOL priceIsEqual = self.price == other.price || [self.price isEqual:other.price];
    BOOL typeIsEqual = self.type == other.type || [self.type isEqual:other.type];
    BOOL weightIsEqual = self.weight == other.weight;
    
    return priceIsEqual && typeIsEqual && weightIsEqual;
}

- (NSUInteger)hash {
    return self.price.hash ^ self.type.hash ^ self.weight;
}

@end
