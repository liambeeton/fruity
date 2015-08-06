//
//  FruitDetailViewControllerShould.m
//  Fruity
//
//  Created by Liam Beeton on 05/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import "BaseTestCase.h"
#import "FruitDetailViewController.h"

@interface FruitDetailViewControllerShould : BaseTestCase

@end

@implementation FruitDetailViewControllerShould {
    FruitDetailViewController *fruitDetailViewController;
}

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testSetNavigationTitleToFruitType {
    NSString *title = @"Apple";
    NSDecimalNumber *price = [[NSDecimalNumber alloc] initWithInt:60];
    
    Fruit *fruit = [[Fruit alloc] initWithPrice:price type:title weight:10];
    
    fruitDetailViewController = [[FruitDetailViewController alloc] init];
    fruitDetailViewController.fruit = fruit;
    
    assertThat(fruitDetailViewController.navigationItem.title, equalTo(title));
}

@end
