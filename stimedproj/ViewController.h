//
//  ViewController.h
//  stimedproj
//
//  Created by a2b.direct on 10/22/17.
//  Copyright © 2017 smapme. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleSignIn/GoogleSignIn.h>

@interface ViewController : UIViewController<GIDSignInUIDelegate>
    
    @property(weak, nonatomic) IBOutlet GIDSignInButton *signInButton;
    
@end

