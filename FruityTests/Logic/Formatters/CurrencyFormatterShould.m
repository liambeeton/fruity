//
//  CurrencyFormatterShould.m
//  Fruity
//
//  Created by Liam Beeton on 07/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import "BaseTestCase.h"
#import "CurrencyFormatter.h"

@interface CurrencyFormatterShould : BaseTestCase

@end

@implementation CurrencyFormatterShould {
    CurrencyFormatter *currencyFormatter;
}

- (void)setUp {
    [super setUp];
    
    currencyFormatter = [[CurrencyFormatter alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testFormatCurrencyAsPoundsWithPence {
    NSString *const Price = @"99.99";
    
    NSString *formattedPrice = [currencyFormatter formatPrice:[NSDecimalNumber decimalNumberWithString:Price]];
    
    assertThat(formattedPrice, equalTo([NSString stringWithFormat:@"£%@", Price]));
}

@end
