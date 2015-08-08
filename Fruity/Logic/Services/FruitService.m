//
//  FruitService.m
//  Fruity
//
//  Created by Liam Beeton on 04/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#import "FruitService.h"
#import "Fruit.h"

#define kFruitDataUrl @"https://raw.githubusercontent.com/fmtvp/recruit-test-data/master/data.json"

@interface FruitService (Private)

- (NSString *)networkRequestCompleteTimeAsString;

@end

@implementation FruitService {
    NSDate *networkRequestStart;
}

- (void)downloadDataFromUrlWithCompletion:(void (^)(NSDictionary *, NSString *, NSError *))completion {
    NSURL *URL = [NSURL URLWithString:kFruitDataUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    networkRequestStart = [NSDate date];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                if (data.length > 0 && error == nil) {
                                                    NSString *requestTime = [self networkRequestCompleteTimeAsString];
                                                    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data
                                                                                                             options:kNilOptions
                                                                                                               error:nil];
                                                    completion(jsonDict, requestTime, nil);
                                                } else {
                                                    completion(nil, nil, error);
                                                }
                                  }];
    [task resume];
}

- (NSString *)networkRequestCompleteTimeAsString {
    double loadTimeInMilliseconds = [networkRequestStart timeIntervalSinceNow] * -1000.00f;
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setMaximumFractionDigits:0];
    [formatter setRoundingMode: NSNumberFormatterRoundDown];
    
    return [formatter stringFromNumber:[NSNumber numberWithDouble:loadTimeInMilliseconds]];
}

@end
