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
    [super initialiseInjector];
    
    fruitDetailViewController = [[FruitDetailViewController alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testSetNavigationTitleToFruitType {
    NSString *title = @"Apple";
    NSDecimalNumber *price = [[NSDecimalNumber alloc] initWithInt:60];
    
    Fruit *fruit = [[Fruit alloc] initWithPrice:price type:title weight:10];
    
    fruitDetailViewController.fruit = fruit;
    
    assertThat(fruitDetailViewController.navigationItem.title, equalTo(title));
}

- (void)testViewControllerInstantiates {
    assertThat(fruitDetailViewController, notNilValue());
}

- (void)testHaveTableViewProperty {
    assertThatBool([fruitDetailViewController respondsToSelector:@selector(tableView)], isTrue());
}

- (void)testHaveTableViewPropertyThatIsWritable {
    assertThatBool([fruitDetailViewController respondsToSelector:@selector(setTableView:)], isTrue());
}

- (void)testHaveInitialisedTableView {
    [fruitDetailViewController viewDidLoad];
    
    assertThat(fruitDetailViewController.tableView, notNilValue());
}

- (void)testBeAnObjectThatConformsToUITableViewDataSource {
    assertThat(fruitDetailViewController, conformsTo(@protocol(UITableViewDataSource)));
}

- (void)testHaveTableViewDataSourceThatIsConnected {
    [fruitDetailViewController viewDidLoad];
    
    assertThat(fruitDetailViewController.tableView.dataSource, notNilValue());
}

- (void)testHaveTableViewAsSubview {
    [fruitDetailViewController viewDidLoad];
    
    NSArray *subviews = fruitDetailViewController.view.subviews;
    
    assertThat(subviews, hasItem(fruitDetailViewController.tableView));
}

- (void)testHaveTableViewWithNumberOfRowsInSection {
    int expectedNumberOfRows = 3;
    
    [fruitDetailViewController viewDidLoad];
    
    assertThatInt([fruitDetailViewController tableView:fruitDetailViewController.tableView numberOfRowsInSection:0], equalToInt(expectedNumberOfRows));
}

- (void)testHaveTableViewWithCellForRowAtIndexPathReturnsCellClass {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    UITableViewCell *cell = [fruitDetailViewController tableView:fruitDetailViewController.tableView cellForRowAtIndexPath:indexPath];
    
    assertThat(cell, instanceOf([UITableViewCell class]));
}

- (void)testHaveTableViewWithCellThatHasReuseIdentifier {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    UITableViewCell *cell = [fruitDetailViewController tableView:fruitDetailViewController.tableView cellForRowAtIndexPath:indexPath];
    
    assertThat(cell.reuseIdentifier, equalTo(@"Cell"));
}

- (void)testHaveTableViewWithCellWithRowAtIndexPathThatReusesCells {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    UITableView *mockTable = OCMClassMock([UITableView class]);
    
    [fruitDetailViewController tableView:mockTable cellForRowAtIndexPath:indexPath];
    
    [mockTable dequeueReusableCellWithIdentifier:@"Cell"];
    
    OCMVerify(mockTable);
}

@end
