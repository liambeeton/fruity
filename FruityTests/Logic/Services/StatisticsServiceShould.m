//
//  StatisticsServiceShould.m
//  Fruity
//
//  Created by Liam Beeton on 08/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <XCTest/XCTest.h>
#import "StatisticsService.h"

@interface StatisticsServiceShould : XCTestCase

@end

@implementation StatisticsServiceShould {
    StatisticsService *statisticsService;
}

- (void)setUp {
    [super setUp];
    
    statisticsService = [[StatisticsService alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testReturnAnArrayOfFruit {
    [statisticsService trackUsageWithEvent:@"load" usageData:@"100" andCompletion:^(NSDictionary *jsonDict) {
        assertThat(jsonDict, isNot(isEmpty()));
    }];
}

@end
