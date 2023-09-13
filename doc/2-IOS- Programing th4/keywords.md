**《IOS编程 第四版》**
> 注意⚠️ 本项目中的部分场景，我结合了 Xcode 12 ，以构建IOS 13 以上的App 为目标（结合目前的IOS UIKit文档做说明），所以和书里面还是有点不一样的
> 注意 本书默认你已经学会了OC ，其中的OC知识点我们不会过多介绍，仅仅给出代码示例 介绍一些核心部分，基础的OC我们将直接略过

相关的文档 [Apple 简体中文](https://developer.apple.com/cn/documentation/) (建议直接英文真的)

这本书中的课后练习由三个层次 分别是 入门，深入，高级，我在这里不会线性取实现，而是学习整本书之后再回来实现

# 打通流程第一个IOS应用
>
> 由于目前 Xcode12 之后的项目创建的默认模板的选项中，interface 可选 StoryBoard，SwiftUI，Language 可选的有 OC 和Swift. 这就与书中的不一样的了，我在这里使用 StoryBoard + OC 去创建

目录简要说明:
![Alt text](./assets/image-1.png)

其中Quiz下就是源代码目录了，有的时候我们还会有 基于 cocas的第三方依赖项 ，和前端的npm node_modules 是一样的道理

```shell
│   ├── AppDelegate.h 
│   ├── AppDelegate.m // Application的Delegate
│   ├── Assets.xcassets // 资源文件
│   │   ├── AccentColor.colorset
│   │   │   └── Contents.json
│   │   ├── AppIcon.appiconset
│   │   │   ├── Contents.json
│   │   │   └── Icon@2x.png
│   │   ├── Contents.json
│   │   └── Default-568h.imageset
│   │       ├── Contents.json
│   │       └── Default-568h@2x.png
│   ├── Base.lproj //两个storyboard （也是一种XIB文件 一种XML格式的文件 Xcode 会把这些xib编译称NIB 并且CV到bundle中 运行的时候就能加载到这些了）
│   │   ├── LaunchScreen.storyboard
│   │   └── Main.storyboard
│   ├── Info.plist
│   ├── SceneDelegate.h 
│   ├── SceneDelegate.m // IOS 13 之后的多屏Delegate
│   ├── ViewController.h
│   ├── ViewController.m // 一个 ViewController（它现在控制着Main.storyboard View视图 
│   └── main.m // App启动入口
```

## 我们先调整 Interface Builder 中的Main，构建几个UI

具体我们需要关注的是下面几个地方
在模板创建完成之后， 修改Main.storyboard
添加组件两个 label 和两个 button
![Alt text](./assets/image.png)

额外的为了搞定位置关系 我们需要 设置一个 约束
![Alt text](./assets/image2.png)

选中组件之后，可以在这两个地方查看和添加 这些约束
![Alt text](./assets/image3.png)

点击重新构建到模拟器上，基本上你的应用外形就已经具备了, 现在我们来+model

## 编写Model

model 就是MVC中的M，负责数据的操作

model.h

```c
#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic, copy) NSArray *answers;
@property (nonatomic, copy) NSArray *questions;

// 携带参数的初始化
- (instancetype)initWithData:(NSArray *)answers quertion:(NSArray *)questions;
// 获取answers questions 依据ID
- (NSArray *)getAAndQ: (int)idx;

@end

```

model.m

```c

#import "Model.h"

@implementation Model

- (instancetype)initWithData:(NSArray *)questions quertion:(NSArray *)answers
{
    self.answers = answers;
    self.questions = questions;
    return self;
}

- (NSArray *)getAAndQ:(int)idx
{
    NSMutableArray *res = [NSMutableArray array];
    [res addObject:self.questions[idx]];
    [res addObject:self.answers[idx]];
    
    return res;
}

@end

```

## 编写Controller

现在我们需要建立View 和 Model 的联系了，这是我们重中之重

```c
// h
#import <UIKit/UIKit.h>
#import "Model.h"

@interface ViewController : UIViewController

@property (nonatomic, assign) int currentQuestionIndex;
@property (nonatomic, strong) Model *model;

@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

- (IBAction)showQuestionButtonPressed:(UIButton *)sender;
- (IBAction)showAnswerButtonPressed:(UIButton *)sender;

@end


// m
#import "ViewController.h"
#import "Model.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark -method
- (IBAction)showQuestionButtonPressed:(UIButton *)sender
{
    
    self.currentQuestionIndex++;

//    NSLog(@"model questions length = %d \n", [self.model.questions count]);
//    NSLog(@"");
    if (self.currentQuestionIndex == [self.model.questions  count]) {

        // Go back to the first question
        self.currentQuestionIndex = 0;
    }

    // Get the string at the index in the questions array
    NSString *question = [self.model getAAndQ:self.currentQuestionIndex][0];
    self.questionLabel.text = question;
    
    //reset answer
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswerButtonPressed:(UIButton *)sender
{
    NSString *answer = [self.model getAAndQ:self.currentQuestionIndex][1];
    self.answerLabel.text = answer;
}

#pragma mark -initValue

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // initModel q nad a
    self.model = [[Model alloc]initWithData:@[@"From what is cognac made?",
                                              @"What is 7+7?",
                                              @"What is the capital of Vermont?"]
                                   quertion: @[@"Grapes",
                                              @"14",
                                              @"Montpelier"]];
}


@end
```

然后我们通过在Storyboard 的操作 把数据和action链接上🔗

![Alt text](./assets/image4.png)

Button的操作也是如此，我们选中 event > Touch up inside 链过去 就好了，重新构建功能上就可以了

## 其它配置(Icon 和 LaunchScreen)

ICON: 在Assets 下选中Icon 上传一张符合要求的png就可以了

LaunchScreen 有些不同
由于LaunchScreen也是一种storyboard 所以我们需要自己去添加一些设置，名为Default-568h 的图片需要先上传到Assets 里面去（拖进去就好了），然后按照步骤操作 添加一个ImageView组件，选中它的属性Img 选择我们的图片，然后给一个约束就好了
![Alt text](./assets/image5.png)

# Objective C语法复习

对象我们一般都是使用 指针变量 获取 （*）,一般的写法如下

## 对象和使用对象

```c
Party *p = [[Party alloc]init];
// 这种写法 又叫做 嵌套消息发送 nested message send

// 如果你不需要这个东西了 你应该释放它的内存
*p  = nil;
```

## 一个命令行Tools

它会循环一个Array 里面的string ，然后依次输出 具体的代码如下

```Objective-C
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *arr = [NSMutableArray array];
        [arr addObject:@"One"];
        [arr addObject:@"Tow"];
        [arr addObject:@"Thired"];
        [arr insertObject:@"Zero" atIndex:0];
        
        for(NSString *item in arr){
            NSLog(@"Arris %@ \n",item);
        }
        arr = nil;
        
    }
    return 0;
}
```

## 子类

这里我们列出文章的核心关键知识点, 子类的定义和使用，实例变量,getter setter, 属性, init方法, overview复写description方法(@的调用输出)

## NSArray NSMutableArray

OC中的Array 可以存储不同的对象。它只保存指针而不关心类型 ，也就是说NULL 无法存入Array 而 [NSNull null] 就可以

# 通过ARC 管理内存

内存管理的特性：指的是 @propertry(nonatomic, weak | strong | copy | unsafe_unretained) ，不是指针额属性可以使用unsafe_unretained 也经常写作assign（同时它也是默认值）
@propertry(nonatomic) int a; 啥都不写它 默认就是unsafe_unretained 的
对于指针类型的 默认是strong @propertry(nonatomic) NSString *a; 默认就是strong
weak是处理强引用引起的循环引用问题
对于某些对象又可修改的子类的时候 应该使用copy 比如NSString 就有 NSMutableString, NSArray 就有 NSMutableArray ,它们就应该使用copy
观察下面的代码

```c
_itemName = [itemName copy];
// 向itemName发出copy msg 返回一个新的NSString对象(原来itemName 上的值都在 不过是在新的对象上)，而不是返回NSMutaleString 确保对象上NSString 而不是NSMutableString
```

属性合成: 与指令 @synthesized 有关
有时候我们定义了属性 但是又想自定义它的getter 和seeter 这个时候 就需要需要用 @synthesized 指令了

```c
@implementation Person

// 下面的指令有三个意思 1创建了存方法 2 创建了取方法 3.实例变量上_age
@synthesized age=_age;
// 也可以这样写 那么含义就变了哈 1创建了存方法 2 创建了取方法 3.实例变量是age
@synthesized age;

// 当然你也可以直接覆盖 getter 和setter 而不是用什么复杂的synthesized....
@end
```

# 视图结构和层次

IOS 13 之后 应用外面是UIScreen 然后是UIWindow ，接下来就是各种 UIWindow 的subView了
视图是UIView对象 它要绘制自己 处理事件
UIView 的frame 属性它保存View的大小和 相对父视图的位置, CGRect结构(没错就是C语言中的结构)  注意啊它的 x y w h 中的xy是相对于它的父亲的xy 哈
构建以一个自定义的UIView 然后捋清楚它们的层次结构
UIView中的drawRect方法(frame 属性和 bounds 属性) 尝试吧window的bounds的大小给View的frame
绘制圆形⭕️
  计算中心点
  计算一个半径
  UIBezierPath 类的文档和官方说明手册

深入学习: Core Graphics
  UIKit中很多的2D绘制 都是由基于C的绘图lib Core Graphics 实现的，UIBezierPath只是封装了一下
高级练习：阴影和渐变

# UIScrollView

什么时候把定义写在 h 什么时候把 定义写在 类扩展？（因为如果要做私有属性什么之类的 就必须使用类扩展 这是一个良好的习惯）
touchesBegan:withEvent 消息, 随机数
运行循环会重回视图（runloop)
setNeedsDispaly-msg
某些UI组件会打算一种要重渲染的标记，而UIView的自定义类就需要自己发送setNeedsDispaly-msg 重绘
重绘某些区域
UIScrollView 适用大屏幕 需要滚动的 内容展示，UIScrollView是“镜头” 子视图是“景观”，当我们移动的时候是移动镜头而不是 景观
捏合缩放 Pinch-to-zoom
拖动和分页
