//
//  FruitViewControllerShould.m
//  Fruity
//
//  Created by Liam Beeton on 04/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
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
    [super initialiseInjector];
    
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

- (void)testViewControllerInstantiates {
    assertThat(fruitViewController, notNilValue());
}

- (void)testHaveTableViewProperty {
    assertThatBool([fruitViewController respondsToSelector:@selector(tableView)], isTrue());
}

- (void)testHaveTableViewPropertyThatIsWritable {
    assertThatBool([fruitViewController respondsToSelector:@selector(setTableView:)], isTrue());
}

- (void)testHaveInitialisedTableView {
    [fruitViewController viewDidLoad];
    
    assertThat(fruitViewController.tableView, notNilValue());
}

- (void)testBeAnObjectThatConformsToUITableViewDataSource {
    assertThat(fruitViewController, conformsTo(@protocol(UITableViewDataSource)));
}

- (void)testHaveTableViewDataSourceThatIsConnected {
    [fruitViewController viewDidLoad];
    
    assertThat(fruitViewController.tableView.dataSource, notNilValue());
}

- (void)testBeAnObjectThatConformsToUITableViewDelegate {
    assertThat(fruitViewController, conformsTo(@protocol(UITableViewDelegate)));
}

- (void)testHaveTableViewDelegateThatIsConnected {
    [fruitViewController viewDidLoad];
    
    assertThat(fruitViewController.tableView.delegate, notNilValue());
}

- (void)testHaveTableViewAsSubview {
    [fruitViewController viewDidLoad];
    
    NSArray *subviews = fruitViewController.view.subviews;
    
    assertThat(subviews, hasItem(fruitViewController.tableView));
}

- (void)testHaveTableViewWithNumberOfRowsInSection {
    int expectedNumberOfRows = 1;
    
    NSString *title = @"Apple";
    NSDecimalNumber *price = [[NSDecimalNumber alloc] initWithInt:60];
    
    Fruit *fruit = [[Fruit alloc] initWithPrice:price type:title weight:10];
    NSArray *fruitArray = [[NSArray alloc] initWithObjects:fruit, nil];
    
    OCMStub([fruitServiceMock allFruit]).andReturn(fruitArray);
    
    [fruitViewController viewDidLoad];
    
    assertThatInt([fruitViewController tableView:fruitViewController.tableView numberOfRowsInSection:0], equalToInt(expectedNumberOfRows));
}

- (void)testHaveTableViewWithCellForRowAtIndexPathReturnsCellClass {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    UITableViewCell *cell = [fruitViewController tableView:fruitViewController.tableView cellForRowAtIndexPath:indexPath];
    
    assertThat(cell, instanceOf([UITableViewCell class]));
}

- (void)testHaveTableViewWithCellThatHasReuseIdentifier {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    UITableViewCell *cell = [fruitViewController tableView:fruitViewController.tableView cellForRowAtIndexPath:indexPath];
    
    assertThat(cell.reuseIdentifier, equalTo(@"Cell"));
}

- (void)testHaveTableViewWithCellWithRowAtIndexPathThatReusesCells {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    UITableView *mockTable = OCMClassMock([UITableView class]);
    
    [fruitViewController tableView:mockTable cellForRowAtIndexPath:indexPath];
    
    [mockTable dequeueReusableCellWithIdentifier:@"Cell"];
    
    OCMVerify(mockTable);
}

@end
