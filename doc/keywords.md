
# 学习

## 第二部分 C语言基础

### 变量和类型
>
> **与某块数据的联系**

变量和类型, 几种c语言中的数据类型，同一类的不同存储形式的 类型转换(float -> double)

条件表达式 和运算符 > < == != && || ! (三元运算)

关于画括号 {}

### function
>
> **与某块代码块的联系**
>

参数 形参 实参 标准库 局部作用域 堆栈帧， 递归 , 全局变量 静态变量,

### 格式化字符串 %d %f 都在这里哈

字符串存储, printf 函数,  %s %d %f 的含义

### 关于Number

整数 浮点数(单精度, 双精度)

### 关于循环♻️

### 关于内存 地址和指针

& 变量的内存地址 十六进制，指针* 去引用，某个特定类型的数据占了多少字节?, 空指针 (nil = NULL )

### 引用传递

传递引用直接用 &声明参数类型, 既得要对NULL 做判断要不然 会引发 空指针异常

### 结构

 结构 struct 成员, typedef简化 C 标准库中的 struct tm， <time.h> 时间标准库

### 堆栈

自动变量， 缓冲区 连续内存 连续内存中的指针操作  运算符-> 释放内存

### 突然间发现 一家好的出版社
>
> 最近在复习和阅读 OC 编程 和 学习Android编程，发现了一个非常厉害的 出版社，,我就看了一部分 真的非常给力**还是我读的书少了🔥！**
>
## 第三部分OC

### 对象

实例变量 方法 和 类 UML图的画法， 消息发送，OC语言的 命名习惯,  向消息传递参数，类的alloc 和 init , 便利方法，向nil 发消息。id ，any的定义

### 对象和内存

指针 和指针指向的对象是不同的两个东西，堆内存管理和ARC、

### NSString

初始化它，-+实例防范和类方法, NSString常用的防方法，参考手册如何查

### NSArray

NSArray ,它是一个不可改变的Array, options 快捷键的使用, 遍历它(for/快速枚举), NSMutableArray, 一些历史遗留下来的语法

### 第一个自定义类

头文件和实现文件cocoa 类，NSObject 子类,  命名规范， 快捷键, 尖括号和双引号的区别，类图的画法，存取方法(getter setter)  self（this）,多个实现文件和资源(别让实现的第三方库), namespace类前缀,

### 属性
>
> ⚠️注意 BIMTime 工程，目前在 CusObject 工程里

 属性=简化getter setter的东西, 原子性 非原子性（多线程), 可读可写，Copy属性， .号调用（仅限getter 和setter

### 继承

关于继承 的UML 画法, 具体的写法 ，没必要额外的多引入子类h interface 声明，overview method ，super，继承的层次，UML 类图画法2 ，类似js中的__proto_ 指挥原型 OC 中称之为 isa, 也会有所谓的原型链🔗
description Method 和 %@ 转换是怎么回事

- 练习略 太多了

### 对象的实例变量 以及其 属性

对象属性，一对一关系，一对多关系，指针关系图 ，只保持指针，对象所有权和ARC。 实例释放的时候会调用的房啊 dealloc, 快捷键 只构建而不运行，@class语法 和编译器的流转，延迟创建机制，

- 练习略 太多了
这一节代码内容在 ./doc/history.md 里，同时也同步到了src下

### 扩展类

回顾(属性  实例变量 方法), 类扩展(与私有属性类似), 子类无法获取 父类的类扩展,

### 内存回收的性能

写一个存在循环引用的例子, 强引用循环，小工具instruments，sleep， 弱引用，编码原则（父拥有子☑️ 🈲️ 子拥有父），弱引用的自动置零特征，( 手动引用计数和ARC的历史，内存管理的一个技巧是写代码的时候就应该从局部考虑问题 理论知识)

### Collection

=> NSArray NSMutableArray , NSSet/NSMutableSet , NSDictionary/NSMutableDictionary
数据结构Set的特征，
数据结构Dictionary 的特征
两个对象是否相等 isEqual
相同的 != 相等的， == 运算是检测 是否相同
NSNutableArray 中的indexOfObject 和indexOfObjectIdenticalTo, 是有区别的，
嵌套的collection是被允许的
为什么要添加不可变的对象?
可变对象和不可变对象copy语法得到的结果是不一样的
collection的Sort method
collection的filter method
关于collection的所有权的问题
C语言的基本类型
nil 不能存 但是 NSNULL 可以

练习略

### 常量

[使用 #define 级 全局变量] 两种方式可以定义常量
预处理器 #define #include 等...
编译器和预编译器处理 这两个命令的过程
宏 的概念（全局代码片段）
全局变量是什么(预处理器宏)
重要的原则

### NSString NSData 对象写入文件

NSMutableStrin, wireToFile方法和 NSError，读取文件，. 文件读写NSDate，寻找指定的目录。

### callback

oc 中有四种途径能够实现 callback（目标-对象，delegate 辅助对象，通知Notification，block对象） , 运行循环，静态变量, 取消编译警告, 协议 和 deleget,
什么时候该使用什么方式去处理event
回调对象的所有权问题 和几个处理原则

### Block对象

block是程序中的一段代码
如何声明一个block
Array的一个以block 对象为参数的方法 enumerateObjectUsingBlock
使用typedef 简化 block的定义实现
block的返回值
匿名的block
block 使用外部变量
block 对象中会无意使用self
block 修改外部变量

练习略

### 协议

对象类和对象的角色 “你是谁 你做什么”
要承担什么角色就需要实现什么方法
类似的泛型写法
某个类实现某个或某些协议
如何判断是否实现了 某些可选方法？

### Property list 格式

它是为读写.plist文件准备 快捷数据访问格式，有多种对象构成 （XML格式的文件快速读写能力）
.plist 文件

## 由事件驱动的应用

### 第一个IOS应用

(注意截止2023年9/1日 目前的XCode 中对于如何按照书中的步骤去创建UI已经不合适了，因此我们需要自己理解一下 要不然就节后Chat GPT了解一下)

ios 应用 cocoa 应用
IOS启动类Delegate 所需要准守的协议,
屏幕管理类 UIWindow
对象图
MVC 设计模式
UIApplication
 #pragma mark 分组和定位
启动方法
设置试图
OC语言是OC语言IOS开发是IOS开发 它们不一样的哈！就像JS是JS  React应用 是React应用
关联按钮的🔘事件
保存到模型数据中去
把数据存到本地文件中去
深入学习Main的作用
如何run 到机器上去？

### 第一个Coca Macos应用

interface builder 用法
> interface builder 的用法还需要研究一下🧐一下才行 bug 还有 addTask 之后无法保存 New Item 也无法双击编辑
> 暂时不知道什么毛病

## OC高级话题

### init 方法

初始化实例变量
默认执行0 和nil
覆盖init方法实现不同的初始化值需求
instanceType类型
一些标准做法（预检查）
带实际参（构造函数？）initWithXXXXX ，如何追加复写到init 里？
关于写init的时的代码风格问题
多个初始化方法（特别是有继承关系的时候要多加小心）初始化方法调用链图
禁用init方法

### 再谈属性

存取类型 readonly
生命周期，它主要关注的存取方法和内存相关的话题assigned ,strong,weak,unsafe_unretained,copy
深入聊聊copy有两种可变的和不可变的
对象的拷贝，如果你自己的类要实现请确保它符合NSCopying协议
**人们对和自己的想法相反的意见是听不进去的**
复写由属性自带的getter 和setter 方法
@synthesize 指令 mushroom 定义

### KVC

KVC能够直接通过名称直接读取属性,
写法对比 setValue:forKey
为什么需要使用KVC（管理自定义数据对象）KVC是一个例外 直接获取数据
非对象类型
valueForKeyPath 获取key路径
KyeString很重要

### KVO

key value observing 值变化的时候 允许接到通知
关于父类的observing 传递context指针
显式触发通知 willChangeValueForKey , didChangeValueKey
独立的属性

### 范畴

这个主要是程序员给已有的类添加方法

## C 语言的高级部分
>
> 想要成为优秀的OC 程序员 , 得先成为一名合格的优秀的C语言程序猿,

### 位运算

一个字节 byte是 无符号的8位整数 0 0 1 1 1 1 0 0 = 60 (二进制)
程序猿经常使用底数位16 的数字系统 16 =2^4，操作系统底层也是使用的它，把上面的 60 二进制 -> 16进制 = 0x80 0x40 0x20 0x10 0x8 0x2 0x1 => 0x3c 使用hexdump t.text 就可以查看所有的字节数据(16进制)

运算1 按位或bitwise-or 运算 =>  01 - 1, 00 - 0 ,11 -1 (规则 有1得1)  ｜
程序中的运用 -> 用一个数字表示两种状态

运算2 按位与 bitwist-and => （规则两个都是1 才得1） &
程序中的运用 -> 检车一个整数种是否包含指定的位(flag)

注意上面的运算 实际的数值不重要 重要的是 它的二进制数 代表的状态

按位异或
规则 有切只有一个1 ^, C 语言中使用 pow() 求幂运算 比如2^3 = pow(2,3) = 12

补数
规则 取相反之的数

左右移位<< >>
00111100 前面的 0 会被丢掉得到 00111100 << 2 = 11110000 (基本上每移动1位 数值就会翻倍)
00111100 前面的 0 会被丢掉得到 00111100 >> 1 = 00011110 (基本上每移动1位 数值就会减半)

用枚举定义位掩码enum
用一组数据的 位元算 来表示不同的程序(业务状态) (题外话 React的源码中也有类似的运用)

```C
enum {
  UIDataDetectorTypePhoneNumber   = 1 << 0,
  UIDataDetectorTypeLink          = 1 << 1,
  UIDataDetectorTypeAddress       = 1 << 2,
  UIDataDetectorTypeCalendarEvent = 1 << 3,
  UIDataDetectorTypeNone          = 0,
  UIDataDetectorTypeAll           = NSUIIntegerMax,
}
```

练习略

### char

C语言中string 是char 类型 OC中是NSString 类型，有时候OC 调C的时候需要传入Char类型而不是NSString 所以你需要了解它

一个字节的数据可以当作字符来处理 ，字符串可以有多种不同的编码格式。最常用的默认编码格式为ASCII 码

(复习一下 *是指针类型 &是取内存地址 运算符)
char* ，C字符串就是内存中的一组相邻的字符 通常以 0x00 结束 例如
0x4c 0x6f 0x76 0x65 0x00
L    o     v    e    \0
创建的char * 的方式

字面量的方式创建 string literal
C中的char 和NSString 之间的相互转换

```objective-c
// NSString -> char
NSString *s = "Hello";
const char *x = NULL;
if([s canBeConvertedToEncoding: NSUTF8StringEncoding]) {
  x  = [s cStringUsingEncoding: NSUTF8StringEncoding]
}

// char -> NSString
char *s = "Hello";
NSString = [NSString stringWithCString:s encoding: NSUTF8StringEncoding];


```

### C语言中的Array
>
> c语言的数组管理的不是某种特定的数据结构，它管理的内存，一块连续的带有启始标识的连续存储空间。

malloc在堆中创建一块内存空间
free释放这块内存空间
也可以使用 string literal 的风格取定义Array

练习略

## 重新审视 Expo
>
> 最近项目 没什么事情 可以做, 我去重新审视了一下 Expo 这个开发工具
> 还是很有东西的，它们的SDK 集成了非常的常用功能，不需要开发者 使用RN 自己去集成各种各样的鬼lib，对于小公司 简直是完美选项！没有之一
