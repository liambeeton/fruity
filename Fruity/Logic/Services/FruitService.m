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

@implementation FruitService

- (void)downloadDataFromUrlWithCompletion:(void (^)(NSDictionary *, NSError *))completion {
    NSURL *URL = [NSURL URLWithString:kFruitDataUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                if (data.length > 0 && error == nil)
                                                {
                                                    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data
                                                                                                             options:kNilOptions
                                                                                                               error:nil];
                                                    completion(jsonDict, nil);
                                                } else {
                                                    completion(nil, error);
                                                }
                                  }];
    [task resume];
}

@end
