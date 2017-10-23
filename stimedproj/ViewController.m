//
//  ViewController.m
//  stimedproj
//
//  Created by a2b.direct on 10/22/17.
//  Copyright © 2017 smapme. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKAccessToken.h>
#import "AllEventsTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self subscribeAppDelegate];
    [self setCustomStyles];
    // Do any additional setup after loading the view, typically from a nib.
    [self initGoogleSignIn];
    [self checkFacebookLogin];
}

-(void) subscribeAppDelegate{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.loginViewController = self;
}

-(void) setCustomStyles{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([self isUserLoggedIn]) {
        // if the user is already logged in, go to the main screen
        [self navigateToMainPage:NO];
    } else {
        // resume pending login (if any)
    }
}
    
-(void) checkFacebookLogin {
    self.fbSignInButton.delegate = self;
    if ([self isUserLoggedIn]) {
        [self navigateToMainPage:true];
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

-(void) googleSignInResultWith:(NSString *)userId {
    if (userId != nil) {
        [self navigateToMainPage:true];
    }
}

- (BOOL)isUserLoggedIn
{
    return [FBSDKAccessToken currentAccessToken] != nil || ([GIDSignIn sharedInstance].currentUser.authentication != nil);
}

- (void)  loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                error:(NSError *)error
{
    if (error == nil && !result.isCancelled) {
        [self navigateToMainPage:true];
    }
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton
{
    // TODO: LOGOUT ACTION, BUT WE DO NOT SEE THIS BUTTON AFTER LOGIN;
}

- (void)navigateToMainPage:(BOOL)animated
{
      AllEventsTableViewController *allEventsVC = [[AllEventsTableViewController alloc] init];
      UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:allEventsVC];
      [self presentViewController:navVC animated:animated completion:nil];
}

-(void) navigateToMainPageBySegue {
    [self performSegueWithIdentifier:@"LoginActionSegue" sender:self];
}

-(void) googleSignOut {
    [[GIDSignIn sharedInstance] signOut];
}

-(void) fbSignOut {
    [[FBSDKLoginManager new] logOut];
}

@end
