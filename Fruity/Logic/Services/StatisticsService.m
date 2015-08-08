//
//  StatisticsService.m
//  Fruity
//
//  Created by Liam Beeton on 07/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#import "StatisticsService.h"

#define kStatisticsUrl @"https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/stats"

@implementation StatisticsService

- (void)trackUsageWithEvent:(NSString *)event usageData:(NSString *)data andCompletion:(void (^)(NSDictionary *))completion {
    NSURL *URL = [NSURL URLWithString:kStatisticsUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                if (data.length > 0 && error == nil) {
                                                    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data
                                                                                                             options:kNilOptions
                                                                                                               error:nil];
                                                    completion(jsonDict);
                                                }
                                            }];
    [task resume];
}

@end