//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by 李仕增 on 2023/9/19.
//

#import "BNRReminderViewController.h"
#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>

// 扩展这个class
@interface BNRReminderViewController ()
@property (nonatomic, weak) IBOutlet UIDatePicker *dataPicker;
@end


@implementation BNRReminderViewController

// 视图添加钱被调用 （多次调用
- (void)viewWillAppear:(BOOL)animated
{
    //animated 用于设置一些过渡动画相关的 这里暂时不介绍了
    [super viewWillAppear:animated];
    
    self.dataPicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

// 视图完成加载时候调用 调用一次
- (void)viewDidLoad {
    
    [super viewDidLoad];
    // 请求通知权限
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert | UNAuthorizationOptionSound) completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (!error && granted) {
            // 用户授予了通知权限
        }
    }];
}

- (IBAction)addReminder:(id)sender
{
    NSDate *date = self.dataPicker.date;
    NSLog(@"Setting ... for %@",date);
    
    
    // 创建本地通知内容
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"这是通知标题";
    content.body = @"这是通知正文";

    // 使用日历触发条件，指定要触发通知的日期和时间
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond) fromDate:date];
        
    UNCalendarNotificationTrigger *trigger = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:dateComponents repeats:NO];


    // 创建通知请求
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"uniqueIdentifier" content:content trigger:trigger];

    // 获取通知中心的实例
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    
    // 将通知请求添加到通知中心content
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if (!error) {
            NSLog(@"本地通知已添加");
        }
    }];
    
}


// 如果名字和NIB 一样 ，那么就不需要手动设置，这也是一种规范哈
//- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:@"BNRReminderViewController" bundle:nil];
//
//    return self;
//}
@end
