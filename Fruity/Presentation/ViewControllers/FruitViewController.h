//
//  FruitViewController.h
//  Fruity
//
//  Created by Liam Beeton on 04/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FruitDetailViewController.h"
#import "FruitService.h"
#import "Fruit.h"

@interface FruitViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) FruitDetailViewController *fruitDetailViewController;
@property (strong, nonatomic) FruitService *fruitService;
@property (strong, nonatomic) NSArray *fruit;

@end
