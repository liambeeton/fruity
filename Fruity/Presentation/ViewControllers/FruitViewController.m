//
//  FruitViewController.m
//  Fruity
//
//  Created by Liam Beeton on 04/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#import <Objection/Objection.h>
#import "FruitViewController.h"

@interface FruitViewController ()

@end

@implementation FruitViewController

objection_requires(@"fruitService")

- (void)viewDidLoad {
    [[JSObjection defaultInjector] injectDependencies:self];
    
    NSAssert([self.fruitService class] == [FruitService class], @"fruitService should be of kind FruitService");
    
    [super viewDidLoad];
    
    // NSArray *fruits = [self.fruitService listOfFruits];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
