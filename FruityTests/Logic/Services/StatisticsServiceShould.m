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

- (void)testTrackUsageForLoadEvent {
    [statisticsService trackUsageWithEvent:@"load" usageData:@"100" andCompletion:^(NSDictionary *jsonDict, NSError *error) {
        assertThat(jsonDict, isNot(nilValue()));
    }];
}

- (void)testTrackUsageForDisplayEvent {
    [statisticsService trackUsageWithEvent:@"display" usageData:@"3000" andCompletion:^(NSDictionary *jsonDict, NSError *error) {
        assertThat(jsonDict, isNot(nilValue()));
    }];
}

- (void)testTrackUsageForErrorEvent {
    NSMutableDictionary *errorDict = [NSMutableDictionary dictionary];
    [errorDict setValue:@"an error has occurred" forKey:NSLocalizedDescriptionKey];
    NSError *error = [NSError errorWithDomain:@"test" code:200 userInfo:errorDict];
    
    [statisticsService trackUsageWithEvent:@"error" usageData:[error localizedDescription] andCompletion:^(NSDictionary *jsonDict, NSError *error) {
        assertThat(jsonDict, isNot(nilValue()));
    }];
}

@end
