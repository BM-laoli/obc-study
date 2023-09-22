//
//  SceneDelegate.m
//  Homepwner
//
//  Created by 李仕增 on 2023/9/20.
//

#import "SceneDelegate.h"
#import "BNRItemViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
        // setRootViewController
        UIWindowScene *windowScene = (UIWindowScene *)scene;

        // 创建一个 UIWindow，并为它设置场景
        self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    
        BNRItemViewController *itemViewController = [[BNRItemViewController alloc]init];
        
    
        // 添加一段 Navigation 代码
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:itemViewController];
    

        // 将根视图控制器设置为窗口的根视图控制器
        self.window.rootViewController = navController;

        self.window.backgroundColor = [UIColor whiteColor];

        // 设置窗口的大小和其他属性
        self.window.frame = windowScene.coordinateSpace.bounds;

        // 将窗口设置为应用程序的主窗口并使其可见
        [self.window makeKeyAndVisible];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
