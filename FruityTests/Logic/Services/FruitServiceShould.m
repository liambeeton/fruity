//
//  FruitServiceShould.m
//  Fruity
//
//  Created by Liam Beeton on 04/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <XCTest/XCTest.h>
#import "FruitService.h"

@interface FruitServiceShould : XCTestCase

@end

@implementation FruitServiceShould {
    FruitService *fruitService;
}

- (void)setUp {
    [super setUp];
    
    fruitService = [[FruitService alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testReturnAnArrayOfFruits {
    NSArray *fruits = [fruitService allFruit];
    
    assertThat(fruits, isNot(isEmpty()));
}

@end
