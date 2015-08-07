//
//  CurrencyFormatter.m
//  Fruity
//
//  Created by Liam Beeton on 07/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#import "CurrencyFormatter.h"

@implementation CurrencyFormatter

- (NSString *)formatPrice:(NSDecimalNumber *)price {
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:@"en_GB"];
    NSString *groupingSeparator = [locale objectForKey:NSLocaleGroupingSeparator];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [formatter setLocale:locale];
    [formatter setGroupingSeparator:groupingSeparator];
    [formatter setGroupingSize:3];
    [formatter setAlwaysShowsDecimalSeparator:NO];
    [formatter setUsesGroupingSeparator:YES];
    
    return [formatter stringFromNumber:price];
}

@end
