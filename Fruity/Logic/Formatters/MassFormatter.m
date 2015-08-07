//
//  MassFormatter.m
//  Fruity
//
//  Created by Liam Beeton on 07/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#import "MassFormatter.h"

@implementation MassFormatter

- (NSString *)formatMass:(double)kilograms {
    NSMassFormatter *massFormatter = [[NSMassFormatter alloc] init];
    return [massFormatter stringFromKilograms:kilograms];
}

@end
