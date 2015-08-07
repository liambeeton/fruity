//
//  Fruit.h
//  Fruity
//
//  Created by Liam Beeton on 04/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fruit : NSObject

@property (nonatomic, readonly) NSDecimalNumber *price;
@property (nonatomic, readonly) NSString *type;
@property (nonatomic, readonly) double weight;

- (instancetype)initWithPrice:(NSDecimalNumber *)price
                         type:(NSString *)type
                       weight:(double)weight;
- (BOOL)isEqual:(id)obj;
- (NSUInteger)hash;

@end
