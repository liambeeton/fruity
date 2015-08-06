//
//  main.m
//  Fruity
//
//  Created by Liam Beeton on 04/08/2015.
//  Copyright (c) 2015 Liam Beeton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        Class appDelegateClass = NSClassFromString(@"TestingAppDelegate");
        if (!appDelegateClass) {
            appDelegateClass = [AppDelegate class];
        }
        return UIApplicationMain(argc, argv, nil, NSStringFromClass(appDelegateClass));
    }
}
