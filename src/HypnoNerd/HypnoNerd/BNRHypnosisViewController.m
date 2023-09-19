//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by 李仕增 on 2023/9/18.
//

#import "BNRHypnosisViewController.h"
#import "HyponsisView.h"

@implementation BNRHypnosisViewController

- (void)loadView
{
    // 加入一个UITextFied
    // 参数 xywh
    CGRect textFiledRect = CGRectMake(70, 120, 240, 30);
    UITextField *textField = [[UITextField alloc]initWithFrame:textFiledRect];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize me";
    textField.returnKeyType = UIReturnKeyDone;
    // 使用这个代码会导致 view 加载的时候 键盘久弹出来了 ，还要注意 模拟器的快捷键 把它开了 ⌘K 才能生效
    //[textField becomeFirstResponder];
    textField.delegate = self;
    
    // create HyponsisView Object
    HyponsisView *backgroudView = [[HyponsisView alloc]init];
    // 把这个对象赋给 View 属性
    self.view = backgroudView;
    self.textFiled1 = textField;
    [self.view addSubview: textField];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"%@", textField.text);
    [self drawHypnoticMessage:textField.text];
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    // 在这里执行清除操作
    textField.text = @"";
    return YES; // 返回 YES 允许清除操作
}

// 自定义一个event 然后去掉delegate
-(void)cleanButtonTapped
{
    SEL clearSelector = @selector(textFieldShouldClear:);
    if ([self.delegate respondsToSelector:clearSelector]) {
        if([self.delegate textFieldShouldClear: self.textFiled1]) {
            self.textFiled1.text = @"";
        }
    } else {
        // 委托对象为 nil，采取适当的备选措施
    }
}

-(void)drawHypnoticMessage:(NSString *)message
{
    for( int i =0; i <20; i++ ){
        UILabel *messageLable = [[UILabel alloc]init];
        
        messageLable.backgroundColor = [UIColor clearColor];
        messageLable.textColor = [UIColor blackColor];
        messageLable.text = message;
        
        // 自动调整UILabel大小 依据文字大小
        [messageLable sizeToFit];
        
        // 随机获取坐标
        int width = (int)(self.view.bounds.size.width - messageLable.bounds.size.width);
        int x = arc4random() % width;
        int height = (int)(self.view.bounds.size.height - messageLable.bounds.size.height);
        int y = arc4random() % height;
        
        CGRect frame = messageLable.frame;
        frame.origin = CGPointMake(x, y);
        messageLable.frame = frame;
        
        [self.view addSubview:messageLable];
        
    }
}
@end
