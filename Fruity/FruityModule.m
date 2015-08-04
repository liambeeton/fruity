//
//  FruityModule.m
//  Fruity
//
//  Created by Liam Beeton on 04/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#import "FruityModule.h"
#import "FruitService.h"

@implementation FruityModule

- (void)configure {
    [self bind:[FruitService class] toProtocol:@protocol(FruitService)];
}

@end
