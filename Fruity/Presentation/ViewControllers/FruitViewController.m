//
//  FruitViewController.m
//  Fruity
//
//  Created by Liam Beeton on 04/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#import <Objection/Objection.h>
#import "FruitViewController.h"

#define kFruitDataKey @"fruit"

@interface FruitViewController (Private)

- (void)refreshFruit;
- (NSString *)viewLoadTimeAsString;

@end

@implementation FruitViewController {
    NSArray *fruitArray;
    NSDate *viewLoadStart;
}

objection_requires(@"tableView", @"fruitDetailViewController", @"fruitService", @"statisticsService")

- (id)init {
    self = [super init];
    if (self) {
        self.navigationItem.title = NSLocalizedString(@"Fruity", nil);
    }
    return self;
}

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    viewLoadStart = [NSDate date];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.statisticsService trackUsageWithEvent:@"display"
                                      usageData:[self viewLoadTimeAsString]
                                  andCompletion:nil];
}

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

#pragma mark - Private helper methods

- (void)refreshFruit {
    [self.fruitService downloadDataFromUrlWithCompletion:^(NSDictionary *jsonDict, NSString *requestTime, NSError *error) {
        if (error == nil) {
            NSMutableArray *dataArray = [[NSMutableArray alloc] init];
            
            NSArray *jsonArray = [jsonDict objectForKey:kFruitDataKey];
            for (id object in jsonArray) {
                Fruit *fruit = [[Fruit alloc] initWithPrice:object[@"price"]
                                                       type:object[@"type"]
                                                     weight:[object[@"weight"] doubleValue]];
                [dataArray addObject:fruit];
            }
            
            [self.statisticsService trackUsageWithEvent:@"load" usageData:requestTime andCompletion:nil];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if ([[NSThread currentThread] isMainThread]){
                    [self updateTableViewWithData:[dataArray copy]];
                }
            });
        } else {
            [self.statisticsService trackUsageWithEvent:@"error" usageData:[error localizedDescription] andCompletion:nil];
        }
    }];
}

- (NSString *)viewLoadTimeAsString {
    double loadTimeInMilliseconds = [viewLoadStart timeIntervalSinceNow] * -1000.00f;
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setMaximumFractionDigits:0];
    [formatter setRoundingMode: NSNumberFormatterRoundDown];
    
    return [formatter stringFromNumber:[NSNumber numberWithDouble:loadTimeInMilliseconds]];
}

#pragma mark - Public helper methods

- (void)updateTableViewWithData:(NSArray *)data {
    fruitArray = data;
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
