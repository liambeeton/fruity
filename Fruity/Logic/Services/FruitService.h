//
//  FruitService.h
//  Fruity
//
//  Created by Liam Beeton on 04/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FruitService <NSObject>

- (NSArray *)listOfFruits;

@end

@interface FruitService : NSObject <FruitService>

@end
