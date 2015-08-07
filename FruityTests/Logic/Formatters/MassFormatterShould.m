//
//  MassFormatterShould.m
//  Fruity
//
//  Created by Liam Beeton on 07/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import "BaseTestCase.h"
#import "MassFormatter.h"

@interface MassFormatterShould : BaseTestCase

@end

@implementation MassFormatterShould {
    MassFormatter *massFormatter;
}

- (void)setUp {
    [super setUp];
    
    massFormatter = [[MassFormatter alloc] init];
}

- (void)tearDown {
    [super tearDown];
}
- (void)testFormatMassAsKilograms {
    double const Weight = 110.00f;
    
    NSString *formattedMass = [massFormatter formatMass:Weight];
    
    assertThat(formattedMass, equalTo(@"110.00 kg"));
}

@end
