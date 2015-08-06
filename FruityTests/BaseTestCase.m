//
//  BaseTestCase.m
//  Fruity
//
//  Created by Liam Beeton on 06/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#import "BaseTestCase.h"

@implementation BaseTestCase {
    JSObjectionInjector *injector;
    JSObjectionModule *testModule;
}

- (void)setUp {
    [super setUp];
    
    testModule = [[JSObjectionModule alloc] init];
    injector = [JSObjection createInjector:testModule];
}

- (void)tearDown {
    [self setRootViewController:nil];
    
    [super tearDown];
}

- (id)mockForClass:(Class)class {
    id mock = OCMClassMock(class);
    [self bindModuleWithMock:mock andClass:class];
    return mock;
}

- (void)bindModuleWithMock:(id)mock andClass:(Class)class {
    [testModule bind:mock toClass:class];
    injector = [JSObjection createInjector:testModule];
    [JSObjection setDefaultInjector:injector];
}

- (void)setRootViewController:(UIViewController *)viewController {
    [UIApplication sharedApplication].delegate.window.rootViewController = viewController;
}

- (UIView *)findSubviewOf:(UIView *)view WithAccessibilityID:(NSString *)identifier {
    NSMutableArray *viewsToSearch = [[NSMutableArray alloc] initWithArray:view.subviews];
    while (viewsToSearch.count > 0) {
        UIView *subview = [viewsToSearch objectAtIndex:0];
        [viewsToSearch removeObjectAtIndex:0];
        if ([subview.accessibilityIdentifier isEqualToString:identifier]) {
            return subview;
        } else {
            [viewsToSearch addObjectsFromArray:subview.subviews];
        }
    }
    return nil;
}

@end
