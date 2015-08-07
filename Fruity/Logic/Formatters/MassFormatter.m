//
//  MassFormatter.m
//  Fruity
//
//  Created by Liam Beeton on 07/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#import "MassFormatter.h"

@implementation MassFormatter

- (NSString *)formatKilograms:(double)kilograms {
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:@"en_GB"];
    
    NSMassFormatter *massFormatter = [[NSMassFormatter alloc] init];
    [[massFormatter numberFormatter] setMinimumFractionDigits:2];
    [[massFormatter numberFormatter] setLocale:locale];
    
    return [massFormatter stringFromKilograms:kilograms];
}

@end
