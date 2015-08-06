//
//  BaseTestCase.h
//  Fruity
//
//  Created by Liam Beeton on 06/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import <Objection/Objection.h>

@interface BaseTestCase : XCTestCase

- (void)initialiseInjector;
- (id)mockForClass:(Class)class;
- (void)setRootViewController:(UIViewController *)viewController;
- (UIView *)findSubviewOf:(UIView *)view WithAccessibilityID:(NSString *)identifier;

@end
