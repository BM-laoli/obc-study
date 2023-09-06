**《IOS编程 第四版》**
> 注意⚠️ 本项目中的部分场景，我结合了 Xcode 12 ，以构建IOS 13 以上的App 为目标（结合目前的IOS UIKit文档做说明），所以和书里面还是有点不一样的

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

# 通过ARC 管理内存

# 试图和试图的层次结构
