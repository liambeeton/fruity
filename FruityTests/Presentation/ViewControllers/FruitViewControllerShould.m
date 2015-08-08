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
    OCMExpect([fruitServiceMock downloadDataFromUrlWithCompletion:[OCMArg any]]);
    
    [fruitViewController viewDidLoad];
    
    OCMVerify([fruitServiceMock downloadDataFromUrlWithCompletion:[OCMArg any]]);
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
    
    NSDecimalNumber *price = [[NSDecimalNumber alloc] initWithInt:60];
    NSString *type = @"Apple";
    NSNumber *weight = [NSNumber numberWithDouble:110.00f];
    
    NSDictionary *fruitDict = [[NSDictionary alloc] initWithObjectsAndKeys:price, @"price", type, @"type", weight, @"weight", nil];
    NSArray *fruitArray = [[NSArray alloc] initWithObjects:fruitDict, nil];
    NSDictionary *dataDict = [[NSDictionary alloc] initWithObjectsAndKeys:fruitArray, @"fruit", nil];
    
    OCMStub([fruitServiceMock downloadDataFromUrlWithCompletion:[OCMArg any]]).andDo(^(NSInvocation *invocation) {
        void (^successBlock)(NSDictionary *jsonDict) = nil;
        
        [invocation getArgument:&successBlock atIndex:2];
        successBlock(dataDict);
        
        [fruitViewController updateTableViewWithData:fruitArray];
    });
    
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
