//
//  StatisticsService.h
//  Fruity
//
//  Created by Liam Beeton on 07/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StatisticsService : NSObject

- (void)trackUsageWithEvent:(NSString *)event
                  usageData:(NSString *)data
              andCompletion:(void (^)(NSDictionary *, NSError *))completion;

@end
