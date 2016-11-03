//
//  AppDelegate.m
//  Sex
//
//  Created by Shendong on 16/9/28.
//  Copyright © 2016年 Shendong. All rights reserved.
//

/*
 bundid :  Shendong.Sex
 */
#import "AppDelegate.h"
#import "WXApi.h"
#import "SexShareSerivce.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <Aspects/Aspects.h>
#import "IPv6Tester.h"
#import "SexConfiguration.h"

#import "SDPagingViewController.h"

@interface AppDelegate ()<WXApiDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [WXApi registerApp:WeChatAppId withDescription:@"WeChat"];
    [self setupTabBarController];
    [self setupNavigationController];
    // [self IPv6AutomaticTest];
    
    [SexConfiguration setDefaultConfiguration];
    
    
    
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
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    return [WXApi handleOpenURL:url delegate:self];
}
- (void)onResp:(BaseResp *)resp{
    if (resp.errCode != 0 ){
        NSLog(@"resp.errstring = %@",resp.errStr);
        return;
    }
    SendAuthResp *_resp = (SendAuthResp *)resp;
    [[[SexShareSerivce shareInstance] fetchAccess_tokenWithCode:_resp.code] subscribeNext:^(id x) {
        NSLog(@"x = %@",x);
    }error:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}
- (void)setupTabBarController{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    UITabBarController *tabbarController = [UITabBarController new];
    
//    UIViewController *homeVC = [[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateInitialViewController];
//    homeVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"tabBar_item0"] selectedImage:[UIImage imageNamed:@"tabBar_item0_1"]];
    
    SDPagingViewController *pag = [[SDPagingViewController alloc] init];
    UINavigationController *homeVC = [[UINavigationController alloc] initWithRootViewController:pag];
    UIViewController *meVC = [[UIStoryboard storyboardWithName:@"Me" bundle:nil] instantiateInitialViewController];
    meVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"tabBar_item4"] selectedImage:[UIImage imageNamed:@"tabBar_item4_1"]];
    
    UIViewController *listVC = [[UIStoryboard storyboardWithName:@"Lists" bundle:nil] instantiateInitialViewController];
    listVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"tabBar_item2"] selectedImage:[UIImage imageNamed:@"tabBar_item2_1"]];
    
    UIViewController *shoppingcartVC = [[UIStoryboard storyboardWithName:@"ShoppingCart" bundle:nil] instantiateInitialViewController];
    shoppingcartVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage imageNamed:@"tabBar_item3"] selectedImage:[UIImage imageNamed:@"tabBar_item3_1"]];
    
    tabbarController.viewControllers = @[homeVC,listVC,shoppingcartVC,meVC];
    [tabbarController.tabBar setTranslucent:NO];
    self.window.rootViewController = tabbarController;
    [self.window makeKeyAndVisible];
    
}
- (void)setupNavigationController{
    NSError *error1 = nil;
    [UINavigationController aspect_hookSelector:@selector(pushViewController:animated:) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> info, UIViewController *viewController, BOOL animated){
        viewController.hidesBottomBarWhenPushed = YES;
    }error:&error1];
}
- (void)IPv6AutomaticTest{
    IPv6Tester *tester = [[IPv6Tester alloc] init];
    [tester test];
}
@end
