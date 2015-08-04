//
//  FruitViewController.h
//  Fruity
//
//  Created by Liam Beeton on 04/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FruitService.h"

@interface FruitViewController : UIViewController

@property (strong, nonatomic) id<FruitService> fruitService;

@end
