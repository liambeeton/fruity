//
//  FruitViewController.m
//  Fruity
//
//  Created by Liam Beeton on 04/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#import <Objection/Objection.h>
#import "FruitViewController.h"

@interface FruitViewController (Private)

- (void)refreshFruit;

@end

@implementation FruitViewController {
    NSArray *fruitArray;
}

objection_requires(@"tableView", @"fruitDetailViewController", @"fruitService")

- (id)init {
    self = [super init];
    if (self) {
        self.navigationItem.title = NSLocalizedString(@"Fruity", nil);
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [[JSObjection defaultInjector] injectDependencies:self];
    
    [super viewDidLoad];
    
    UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                                   target:self
                                                                                   action:@selector(refreshFruit)];
    self.navigationItem.rightBarButtonItem = refreshButton;
    
    self.tableView.frame = self.view.bounds;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.userInteractionEnabled = YES;
    self.tableView.contentMode = UIViewContentModeRedraw;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self.view addSubview:self.tableView];
    
    [self refreshFruit];
}

#pragma mark - Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Private methods

- (void)refreshFruit {
    fruitArray = [self.fruitService allFruit];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [fruitArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellEditingStyleNone;
    }
    
    Fruit *fruit = [fruitArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = fruit.type;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.fruitDetailViewController.fruit = [fruitArray objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:self.fruitDetailViewController animated:YES];
}

@end
