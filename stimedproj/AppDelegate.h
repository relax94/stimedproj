//
//  AppDelegate.h
//  stimedproj
//
//  Created by a2b.direct on 10/22/17.
//  Copyright © 2017 smapme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleSignIn/GoogleSignIn.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "ViewController.h"

@class ViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate, GIDSignInDelegate>

@property (weak, nonatomic) ViewController *loginViewController;
@property (strong, nonatomic) UIWindow *window;


@end

