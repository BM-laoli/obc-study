
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

## 重新审视 Expo
>
> 最近项目 没什么事情 可以做, 我去重新审视了一下 Expo 这个开发工具
> 还是很有东西的，它们的SDK 集成了非常的常用功能，不需要开发者 使用RN 自己去集成各种各样的鬼lib，对于小公司 简直是完美选项！没有之一
