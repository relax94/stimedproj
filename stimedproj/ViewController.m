//
//  ViewController.m
//  stimedproj
//
//  Created by a2b.direct on 10/22/17.
//  Copyright © 2017 smapme. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKAccessToken.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initGoogleSignIn];
    [self checkFacebookLogin];
}
    
-(void) checkFacebookLogin {
    if ([FBSDKAccessToken currentAccessToken]) {
        NSLog(@"FAACECEC LOF");
    }
}

-(void) initGoogleSignIn {
    // TODO: Move Key Into Preferences
    [GIDSignIn sharedInstance].clientID = @"1093599866554-g55kvf67d1pk6ubq48au7r1ljis7aobo.apps.googleusercontent.com";
    [GIDSignIn sharedInstance].uiDelegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
