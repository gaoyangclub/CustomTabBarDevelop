//
//  AppDelegate.m
//  CustomTabViewController
//
//  Created by admin on 16/10/24.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "GYTabBarController.h"
#import "DIYTabBarItem.h"
#import "SortViewController.h"
#import "JKNavigationController.h"
#import "JKRootNavigationController.h"
#import "UserHomeController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


-(JKRootNavigationController*)createNavigationController:(UIViewController*)viewController{
    JKRootNavigationController* navigationController = [[JKRootNavigationController alloc]initWithRootViewController:viewController];
    navigationController.automaticallyAdjustsScrollViewInsets = navigationController.navigationBar.translucent = NO;
    /// 全局效果
//    [navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
//    /// 只会设置当前控制器的navigationBar的颜色
//    [navigationController.navigationBar jk_setNavigationBarBackgroundColor:[UIColor orangeColor]];
    ///  会设置所有子控制器的全屏手势使能状态，全局效果
    navigationController.jk_fullScreenPopGestrueEnabled = YES;
    return navigationController;
}

-(UITabBarController*)createNormalTabBar{
    
    UINavigationController* itemCtrl1 = [self createNavigationController:[[ViewController alloc] init]];
    UINavigationController* itemCtrl2 = [self createNavigationController:[[ViewController alloc] init]];
    itemCtrl2.title = @"测试标题2";
//    itemCtrl2.view.backgroundColor = [UIColor grayColor];
    
    UINavigationController* itemCtrl3 = [self createNavigationController:[[SortViewController alloc] init]];
    itemCtrl3.title = @"测试标题3";
//    itemCtrl3.view.backgroundColor = [UIColor greenColor];
    
    UINavigationController* itemCtrl4 = [self createNavigationController:[[UserHomeController alloc] init]];
    itemCtrl4.title = @"测试标题4";
//    itemCtrl4.view.backgroundColor = [UIColor blueColor];
    
//    UITabBarController* tabBarCtl = [[UITabBarController alloc] init];
//    [tabBarCtl setViewControllers:@[itemCtrl1,itemCtrl2,itemCtrl3] animated:YES];
    
//    tabBarCtl.tabBar.backgroundColor = [UIColor whiteColor];
    
//    UITabBarItem* barItem1 = [[UITabBarItem alloc] initWithTitle:@"橙色" image:nil tag:11];
//    UITabBarItem* barItem2 = [[UITabBarItem alloc] initWithTitle:@"灰色" image:nil tag:11];
//    UITabBarItem* barItem3 = [[UITabBarItem alloc] initWithTitle:@"绿色" image:nil tag:11];
//    itemCtrl1.tabBarItem = barItem1;
//    itemCtrl2.tabBarItem = barItem2;
//    itemCtrl3.tabBarItem = barItem3;
    
    GYTabBarController* tabBarCtl = [[GYTabBarController alloc] init];
    tabBarCtl.itemClass = [DIYTabBarItem class];
    tabBarCtl.dataArray = @[[TabData initWithParams:[DIYBarData initWithParams:@"安卓" image:@"\U00003605"] controller:itemCtrl1],
                            [TabData initWithParams:[DIYBarData initWithParams:@"保障" image:@"\U0000346c"] controller:itemCtrl2],
                            [TabData initWithParams:[DIYBarData initWithParams:@"付款" image:@"\U0000346e"] controller:itemCtrl3],
                            [TabData initWithParams:[DIYBarData initWithParams:@"微博" image:@"\U000035ec"] controller:itemCtrl4],
                            ];
//    tabBarCtl.view.backgroundColor = [UIColor yellowColor];
    
    //\U00003439 \U000035ad \U000035ae \U000035af \U000035eb \U000035ec \U00003605"
    [tabBarCtl setItemBadge:20 atIndex:0];
    [tabBarCtl setItemBadge:5 atIndex:1];
//    [tabBarCtl setItemBadge:80 atIndex:2];
    [tabBarCtl setItemBadge:100 atIndex:3];
    return tabBarCtl;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [self createNormalTabBar];//可替换
    
    return YES;
}


//获取当前屏幕显示的viewcontroller
+ (UINavigationController *)getCurrentNavigationController
{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UINavigationController *currentVC = [self getCurrentVCFrom:rootViewController];
    
    return currentVC;
}

+ (UINavigationController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UINavigationController *currentNaviVC;
    
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        
        currentNaviVC = [rootVC presentedViewController].navigationController;
    } else if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        
        currentNaviVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
        
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        if ([rootVC isMemberOfClass:[JKRootNavigationController class]]) {
            currentNaviVC = [(UINavigationController *)rootVC visibleViewController].childViewControllers.firstObject;
        }else{
            currentNaviVC = (UINavigationController *)rootVC;
        }
    } else {
        // 根视图为非导航类
        currentNaviVC = rootVC.navigationController;
    }
    
    return currentNaviVC;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
