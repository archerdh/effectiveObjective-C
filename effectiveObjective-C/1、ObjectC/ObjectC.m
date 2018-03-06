//
//  ObjectC.m
//  effectiveObjective-C
//
//  Created by zheng zhang on 2018/3/6.
//  Copyright © 2018年 star. All rights reserved.
//

#import "ObjectC.h"

@implementation ObjectC

+ (void)getMessage
{
    //1、了解OC的起源
    /*
     1、Objective-C从Smalltalk语言是从Smalltalk语言演化而来，Smalltalk是消息语言的鼻祖。
     2、Objective-C是C语言的超集，在C语言基础上添加了面向对象等特性，可能一开始接触时你会觉得语法有点奇怪，那是因为Objective-C使用了动态绑定的消息结构，而Java，C++等等语言使用的是函数调用。
     3、消息结构与函数调用的关键区别在于：函数调用的语言，在编译阶段由编译器生成一些虚方法表，在运行时从这个表找到所要执行的方法去执行。而使用了动态绑定的消息结构在运行时接到一条消息，接下来要执行什么代码是运行期决定的，而不是编译器。
     
     someStr和anotherStr是指针对象，分配在栈上；
     “The String”是oc对象，分配在堆空间；
     OC中所有对象所在内存从事分配在堆空间；
     结构体等非对象类型分配在栈空间，不需要额外内存开销；
     分配在堆中的内存必须直接管理，而分配在栈空间的内存则会在栈帧弹出是自动清理；
     */
    NSString *someStr = @"The String";
    NSString *anotherStr = someStr;
    
    //2、在类头文件中尽量少import其他文件
    /*
     1、如果需要引用一个类文件时，只是需要使用类名，不需要知道其中细节，可以用@class xx.h，这样做的好处会减少一定的编译时间。如果是用的#import全部导入的话，会出现a.h import了b.h,当c.h 又import a.h时，把b.h也都导入了，如果只是用到类名，真的比较浪费，也不够优雅
     2、有时候无法使用@class向前声明，比如某个类要遵循一项协议，这个协议在另外一个类中声明的，可以将协议这部分单独放在一个头文件，或者放在分类当中，以降低引用成本。
     */
    
    //3、多用字面量语法，少用与之等价的方法
    
    //除非确有必要，否则不要在.h引用头文件；如果没办法，可以使用扩展单独引用；
    /*
     假设obj2为nil;
     obj1和obj3正常，字面语法数组B会抛出异常，A会创建出来，但是其中只含有obj1对象，原因在于arrayWithObjects方法会依次处理各个参数，知道发现nil为止，由于obj2为nil，方法会提前结束。
     因此，使用字面语法会更安全，提前报错可以快速解决问题，而数组顺序或数量错误，不好追踪。多用字面语法，取元素多用取下标操作；
     
     不过字面量语法有一个小缺点就是创建的数组，字符串等等对象都是不可变的，如果想要可变的对象需要自己多执行一步mutableCopy，
     例如
     NSMutableArray *languages = [@[@"PHP", @"Objective-C", @"Swift", @"Python"] mutableCopy];
     */
    
    id obj1;
    id obj2;
//    id obj2 = nil;
    id obj3;
    //传统创建方法:
    NSArray *A = [NSArray arrayWithObjects:obj1, obj2, obj3, nil];
    //字面语法
    NSArray *B = @[obj1, obj2, obj3];
    
    //4、多用常量类型，少用#define
    /*
     宏定义跟const的区别：
     1.宏在编译开始之前就会被替换，而const只是变量进行修饰;
     2.宏可以定义一些函数方法，const不能
     3.宏编译时只替换不做检查不报错，也就是说有重复定义问题。而const会编译检查，会报错
     
     定义不对外公开的常量的时候，我们应该尽量先考虑使用 static 方式声名const来替代使用宏定义。const不能满足的情况再考虑使用宏定义。比如用以下定义：
     static NSString * const kConst = @"Hello"；
     static const CGFloat kWidth = 10.0;
     定义对外公开的常量的时候，我们一般使用如下定义：
     .h
     extern NSString * const CLASSNAMEconst;
     .m
     NSString * const CLASSNAMEconst = @"hello";
     
     //全局变量，constString1地址不能修改，constString1值能修改
     const NSString *constString1 = @"I am a const NSString * string";
     //无区别
     NSString const *constString2 = @"I am a NSString const * string";
     //constString1 跟constString2 无区别.
     //＊左边代表指针本身的类型信息，const表示这个指针指向的这个地址是不可变的
     //＊右边代表指针指向变量的可变性，即指针存储的地址指向的内存单元所存储的变量的可变性
     static const NSString *staticConstString1 = @"I am a static const NSString * string";
     static NSString const *staticConstString2 = @"I am a static NSString const * string";
     //stringConst 地址能修改，stringConst值不能修改
     NSString * const stringConst = @"I am a NSString * const string";
     
     不要用define定义常量，因为没有类型声明，如果code过程中突然更改，不易察觉到错误（将bool改为int并且无需声明类型）；
     通常在.m中使用static const来定义常量；
     如果要声明全局常量，使用extren，可以放在公共.h中，通常需要加前缀用以区分；
     */
    
    //5、用枚举表示状态、选项等
    /*
     枚举的使用场景非常多，可以代表状态，方向等，
     如果枚举选项多个可用，那么就将各选项值定义为2的幂，以便通过按位与按位或将其组合；
     处理枚举的swicth语句时，不要实现default分支，这样扩展枚举时，编译器就会警告补全switch枚举，方便开发；
     从枚举定义来看，
     NS_ENUM和NS_OPTIONS本质是一样的，仅仅从字面上来区分其用途。
     NS_ENUM是通用情况，NS_OPTIONS一般用来定义具有位移操作或特点的情况（bitmask)。
     */
}

@end
