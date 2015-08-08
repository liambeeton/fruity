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

- (void)testDownloadJsonDataFromUrl {
    [fruitService downloadDataFromUrlWithCompletion:^(NSDictionary *jsonDict) {
        assertThat(jsonDict, isNot(isEmpty()));
    }];
}

@end
