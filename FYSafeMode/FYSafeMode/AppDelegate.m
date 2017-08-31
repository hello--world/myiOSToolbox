//
//  AppDelegate.m
//  FYSafeMode
//
//  Created by hfy on 2017/8/31.
//  Copyright © 2017年 hihfy. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
// 解决应用已经运行的情况下，给提示的问题，名字有点修改
@property (nonatomic, assign) BOOL isSafeModeHandleURL;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // fy://safemode
    // Override point for customization after application launch.
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"test" message:[NSString stringWithFormat:@"%@",launchOptions] delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil];
//    [alert show];
    //

    // 点击通知页可以
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    NSURL *url = launchOptions[UIApplicationLaunchOptionsURLKey];
    BOOL needSetup = YES;
    UIViewController *rootVC = nil;
    self.isSafeModeHandleURL = YES;
    if (url) {
        if ([[url host] isEqualToString:@"safemode"]) {
            self.isSafeModeHandleURL = NO;

            needSetup = NO;
            rootVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"FYSafeModeViewController"];
        }
    } else {
        rootVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];
    }
    
    if (needSetup) {
    // setup
    }
    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
    if ([[url host] isEqualToString:@"safemode"] && self.isSafeModeHandleURL) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"请关闭应用后再通过该方式打开" message:[NSString stringWithFormat:@"%@",options] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    abort();
}

@end
