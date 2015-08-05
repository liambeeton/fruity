//
//  FruitServiceShould.m
//  Fruity
//
//  Created by Liam Beeton on 04/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "FruitService.h"

@interface FruitServiceShould : XCTestCase

@property (strong, nonatomic) FruitService *fruitService;

@end

@implementation FruitServiceShould

- (void)setUp {
    [super setUp];
    
    self.fruitService = [[FruitService alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testReturnAnArrayOfFruits {
    NSArray *fruits = [self.fruitService allFruits];
    
    XCTAssert([fruits count] > 0, @"Fruit array item count should be greater than zero");
}

- (void)testPerformanceExample {
    [self measureBlock:^{
    }];
}

@end
