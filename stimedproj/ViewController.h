//
//  ViewController.h
//  stimedproj
//
//  Created by a2b.direct on 10/22/17.
//  Copyright © 2017 smapme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginButton.h>
#import <GoogleSignIn/GoogleSignIn.h>

@interface ViewController : UIViewController<GIDSignInUIDelegate, FBSDKLoginButtonDelegate>

@property(assign, nonatomic) IBOutlet FBSDKLoginButton *fbSignInButton;
@property(weak, nonatomic) IBOutlet GIDSignInButton *signInButton;

-(void) googleSignInResultWith: (NSString*)userId;
    
@end

