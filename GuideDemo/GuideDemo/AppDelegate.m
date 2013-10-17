//
//  AppDelegate.m
//  GuideDemo
//
//  Created by lishuai on 13-10-17.
//  Copyright (c) 2013年 lishuai. All rights reserved.
//

#import "AppDelegate.h"
#import "GDGuideVC.h"
#import "FirstView.h"
#import "SecondView.h"
#import "ThirdView.h"
#import "GuideImageView.h"

#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    GDGuideVC *guideVC = [[GDGuideVC alloc] init];
    
    /**
     *  垂直滑动
     *  无翻页
     *  动画变化点：（160，350）
     *  scrollView的长度增加 400
     *  模板：赶集网
     */
//    FirstView *firstView= [[FirstView alloc] initWithFrame:CGRectMake(80, kScreenHeight-180, 160, 40)];
//    SecondView *secondView = [[SecondView alloc] initWithFrame:CGRectMake(60, kScreenHeight, 200, 40)];
//    ThirdView *thirdView = [[ThirdView alloc] initWithFrame:CGRectMake(110, kScreenHeight+150, 100, 80)];
//    NSMutableArray *guideViewArray = [[NSMutableArray alloc] initWithObjects:firstView,secondView, thirdView,nil];
//
//    guideVC.scrollPagingEnabled = NO;
//    guideVC.slideDirectionType = verticalType;
//    guideVC.changePoint = CGPointMake(160, 350);
//    guideVC.scrollViewContentLength = 400;

   
   
    /**
     *  水平滑动 或者 垂直滑动
     *  有翻页
     *  动画变化点: (0,0)默认设置
     *  模板:普通app的新手引导 墨迹天气
     */
    
    GuideImageView *imageView1 = [[GuideImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) withImage:@"guide_1"];
    GuideImageView *imageView2 = [[GuideImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) withImage:@"guide_2"];
    GuideImageView *imageView3 = [[GuideImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) withImage:@"guide_3"];
    GuideImageView *imageView4 = [[GuideImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) withImage:@"guide_4"];
    
    guideVC.scrollPagingEnabled = YES;
    guideVC.slideDirectionType = horizontalType;
    
    
    NSMutableArray *guideViewArray = [[NSMutableArray alloc] initWithObjects:imageView1,imageView2, imageView3,imageView4,nil];
    guideVC.guideViewArray = guideViewArray;
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"maidi"]];
    bgImageView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    bgImageView.userInteractionEnabled = YES;
    
    guideVC.backgroudView = bgImageView;

    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:guideVC];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
