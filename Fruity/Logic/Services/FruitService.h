//
//  FruitService.h
//  Fruity
//
//  Created by Liam Beeton on 04/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FruitService : NSObject

- (void)downloadDataFromUrlWithCompletion:(void (^)(NSDictionary *, NSError *))completion;

@end
