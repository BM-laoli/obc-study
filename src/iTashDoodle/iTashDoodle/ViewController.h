//
//  ViewController.h
//  iTashDoodle
//
//  Created by administrator on 2023/9/1.
//

#import <UIKit/UIKit.h>

// C语言辅助function
NSString *docPath(void);


@interface ViewController : UIViewController<UITableViewDataSource>

@property (nonatomic) UITableView *taskTable;
@property (nonatomic) UITextField *taskField;
@property (nonatomic) UIButton *inserButton;

@property (nonatomic) NSMutableArray *task;

- (void)addTask: (id) sener;

@end

