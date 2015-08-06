//
//  FruitDetailViewController.m
//  Fruity
//
//  Created by Liam Beeton on 05/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#import <Objection/Objection.h>
#import "FruitDetailViewController.h"

@interface FruitDetailViewController (Private)

@end

@implementation FruitDetailViewController

objection_requires(@"tableView", @"fruit")

- (void)setFruit:(Fruit *)fruit {
    if (![_fruit isEqual:fruit]) {
        if (fruit.price != nil && fruit.type != nil) {
            _fruit = fruit;
            self.navigationItem.title = fruit.type;
        }
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [[JSObjection defaultInjector] injectDependencies:self];
    
    [super viewDidLoad];
    
    self.tableView.frame = self.view.bounds;
    self.tableView.dataSource = self;
    self.tableView.userInteractionEnabled = YES;
    self.tableView.contentMode = UIViewContentModeRedraw;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellEditingStyleNone;
    }
    
    if (indexPath.row == 0) {
        cell.textLabel.text = [self.fruit.price stringValue];
    } else if (indexPath.row == 1) {
        cell.textLabel.text = self.fruit.type;
    } else if (indexPath.row == 2) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@", @(self.fruit.weight)];
    }
    
    return cell;
}

@end
