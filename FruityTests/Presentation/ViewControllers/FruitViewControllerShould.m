//
//  FruitViewControllerShould.m
//  Fruity
//
//  Created by Liam Beeton on 04/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#import "BaseTestCase.h"
#import "FruitViewController.h"
#import "FruitService.h"

@interface FruitViewControllerShould : BaseTestCase

@end

@implementation FruitViewControllerShould {
    id fruitServiceMock;
    FruitViewController *fruitViewController;
}

- (void)setUp {
    [super setUp];
    
    fruitServiceMock = [self mockForClass:[FruitService class]];
    fruitViewController = [[FruitViewController alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testLoadAllFruit {
    [fruitViewController viewDidLoad];
    
    OCMVerify([fruitServiceMock allFruit]);
}

@end
