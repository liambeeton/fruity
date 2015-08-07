//
//  FruitDetailViewController.h
//  Fruity
//
//  Created by Liam Beeton on 05/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Fruit.h"
#import "CurrencyFormatter.h"
#import "MassFormatter.h"

@interface FruitDetailViewController : UIViewController<UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) Fruit *fruit;
@property (strong, nonatomic) CurrencyFormatter *currencyFormatter;
@property (strong, nonatomic) MassFormatter *massFormatter;

@end
