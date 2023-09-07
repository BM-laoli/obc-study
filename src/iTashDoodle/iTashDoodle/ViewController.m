//
//  ViewController.m
//  iTash;Doodle
//
//  Created by administrator on 2023/9/1.
//

#import "ViewController.h"

NSString *ViewControllerDocPath(void)
{
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return  [pathList[0] stringByAppendingPathComponent:@"data.td"];
}

@interface ViewController ()
@end

@implementation ViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 由于只有一个表格段 可以忽略表格索引
    return [self.task count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 性能 先check是否有可重复使用的UITableVieCell
    UITableViewCell *cell = [self.taskTable dequeueReusableCellWithIdentifier:@"Cell"];
    
    // 依据模型 设置cell对象
    NSString *item = [self.task objectAtIndex:indexPath.row];
    cell.textLabel.text = item;
    return  cell;
}

#pragma mark deleaget事件
-(void)addTask:(id)sener
{
    NSString *text  = [self.taskField text];
    if([text length] == 0){
        return;
    }
    
    // 载入数据如何刷新
    [self.task addObject:text];
    [self.taskTable reloadData];
    
    // 恢复UI状态
    [self.taskField setText:@""];
    [self.taskField resignFirstResponder];
    
}

#pragma 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.task = [NSMutableArray array];
    NSArray *plis = [NSArray arrayWithContentsOfFile:ViewControllerDocPath()];
    if(plis){
        self.task = [plis mutableCopy];
    }else{
        self.task = [NSMutableArray array];
    }
    
    // 获取当前window
    //UIWindowScene *windowScene = (UIWindowScene *)[UIApplication sharedApplication].connectedScenes.allObjects.firstObject;
    //UIWindow *mainWindow = windowScene.windows.firstObject;
    
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    //NSLog(@"--wind %f",screenBounds.size.width);
    
    // 创建三个UI对象的frame 属性
    CGRect tableFrame = CGRectMake(0, 80, screenBounds.size.width,screenBounds.size.height-100);
    CGRect fileFrame = CGRectMake(40, 60, 200, 31);
    CGRect buttonFrame = CGRectMake(248, 60, 72, 31);
    
    // 创建UITabelView
    self.taskTable = [[UITableView alloc]initWithFrame:tableFrame style:UITableViewStylePlain];
    self.taskTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 需要创建单元格时 高数UITableView要实例化那个类
    [self.taskTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    // 创建UITextFeid 设置UIButton
    self.taskField = [[UITextField alloc]initWithFrame:fileFrame];
    self.taskField.borderStyle = UITextBorderStyleRoundedRect;
    self.taskField.placeholder = @"Type a task ,tap insert";
    
    self.inserButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    self.inserButton.frame = buttonFrame;
    [self.inserButton setTitle:@"Insert" forState:UIControlStateNormal];
    
    
    // 把这些UI放到屏幕上去
    [self.view addSubview:self.taskTable];
    [self.view addSubview:self.taskField];
    [self.view addSubview:self.inserButton];
    
    //---- 设置事件
    [self.inserButton addTarget:self action:@selector(addTask:) forControlEvents:UIControlEventTouchUpInside];
    self.taskTable.dataSource = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackgroud:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
}

- (void) applicationDidEnterBackgroud:(NSNotification *)notifation
{
    [self.task writeToFile:ViewControllerDocPath() atomically:YES];
}
@end
