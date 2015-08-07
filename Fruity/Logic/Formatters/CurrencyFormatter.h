//
//  CurrencyFormatter.h
//  Fruity
//
//  Created by Liam Beeton on 07/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrencyFormatter : NSObject

- (NSString *)formatPrice:(NSDecimalNumber *)price;

@end
