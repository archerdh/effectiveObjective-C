//
//  Object&Message%Runtime.m
//  effectiveObjective-C
//
//  Created by zheng zhang on 2018/3/6.
//  Copyright © 2018年 star. All rights reserved.
//

#import "Object_Message_Runtime.h"
#import "PropertyExample.h"
#import "StrongCopyExample.h"
#import <objc/message.h>
@interface Object_Message_Runtime()

@end

@implementation Object_Message_Runtime

+ (void)getMessage
{
    //6、理解属性概念
    /*
     1、定义对外开放的属性时候尽量做到暴露权限最小化，不希望被修改的属性要加上readonly。
     2、atomic 并不能保证多线程安全，例如一个线程连续多次读取某个属性的值，而同时还有别的线程在修改这个属性值得时候，也还是一样会读到不同的值。
     atomic 的原理只是在 setter and getter 方法中加了一个@synchronized(self)，所以iOS开发中属性都要声明为nonatomic,因为atomic严重影响了性能，但是在Mac OSX上开发却通常不存在这个性能问题
     
     
     assign，针对基本数据类型的简单赋值操作；
     strong拥有关系，设置方法保留新值，释放旧值；
     weak非拥有关系，设置方法既不保留新值，也不释放旧值，同assign类似，然而在所指对象销毁时，属性也会清空；
     unsafe_unretained非拥有关系，特质语义同assign类似，但适用于对象类型，当目标对象遭到摧毁，属性值不会清空，同weak的区别；
     copy拥有关系，设置方法不保留新值，而是将其拷贝。
     eg
     1 @property (nonatomic, strong) NSString *string1;
     2 @property (nonatomic, unsafe_unretained) NSString *string2;
     
     1. self.string1 = @"String 1";
     2. self.string2 = self.string1;
     3. self.string1 = nil;
     4. NSLog(@"String 2 = %@", self.string2);
     打印结果，会直接crash，其实就是野指针造成的，所以野指针是可怕的。
     为何会造成野指针呢？
     同于用unsafe_unretained声明的指针，由于self.string1 = nil已将内存释放掉了，但是string2并不知道已被释放了，所以是野指针。然后访问野指针的内存就造成crash.  所以尽量少用unsafe_unretained关键字。
     getter获取方法，可以重设get方法。
     eg.@property(nonatomic, getter = isOn) BOOL on;
     开发过程中尽量使用nonatomic属性，因为ios中atomic属性会严重影响性能，但mac osX不会有性能瓶颈；
     */
    PropertyExample *example = [[PropertyExample alloc] init];
    
    //Nsstring使用copy不是用strong的原因:
    StrongCopyExample *stong = [[StrongCopyExample alloc] init];

    //7、在对象内部尽量直接访问实例变量
    /*
     1、在类内读取属性的数据时，应该通过直接实例变量来读，这样不经过Objecit-C的方法派发，编译器编译后的代码结果是直接访问存实例变量的那块内存中的值，而不会生成走方法派发的代码，这样的速度会更快。
     2、给属性写入数据时，应该通过属性的方式来写入，这样会调用setter 方法。但是在某种情况下初始化方法以及dealloc方法中，总是应该直接通过实例变量来读写数据，这样做是为了避免子类复写了setter方法造成的异常。
     3、使用了懒加载的属性，应该一直保持用属性的方式来读取写入数据
     */
    
    //8、理解“对象等同性”这一概念
    /*
     NSString *aString = @"iphone 8";
     NSString *bString = [NSString stringWithFormat:@"iphone %i", 8];
     NSLog(@"%d", [aString isEqual:bString]);
     NSLog(@"%d", [aString isEqualToString:bString]);
     NSLog(@"%d", aString == bString);
     
     答案是110
     ==操作符只是比较了两个指针，而不是指针所指的对象
     若想检测对象的等同性，使用isEqual和hash方法；相同的对象必须具有相同的hash值，两个hash值相同的对象未必相同；
     
     容器中可变类的等同性:
     NSMutableSet *set = [NSMutableset new];
     NSMutableArray *A = @[@[@1, @2] mutableCopy];
     [set addObject:A];          //OutPut:set = {((1, 2))}
     
     NSMutableArray *B = @[@[@1, @2] mutableCopy];
     [set addObject:B];          //OutPut:set = {((1, 2))}
     此时set里仍然只有一个对象，因为刚要添加的数组与set已有对象相同，所以set不改变
     
     NSMutableArray *C = @[@[@1] mutableCopy];
     [set addObject:C];          //OutPut:set = {((1, 2), (1))}
     
     最后我们改变C内容，另其与之前的元素相同
     [C addObject:@2];      //OutPut:set = {((1, 2), (1, 2))}
     set包含了两个彼此相同的数组，根据set的语法是不允许这样的情况出现的，然后现在却无法保证这一点了
     
     NSSet *setB = [set copy];     //OutPut:setB = {((1, 2))}
     复制过的set又剩一个对象了
     */
    
    //9、以类族模式隐藏实现细节
    /*
     id maybeAnArray = @[];
     if ([maybeAnArray class] == [NSArray class]) {
        //Code will never be executed
     }
     因为[maybeAnArray class] 的返回永远不会是NSArray，NSArray是一个类族，返回的值一直都是NSArray的实体子类。大部分collection类都是某个类族中的’抽象基类’
     所以上面的if想要有机会执行的话要改成
     id maybeAnArray = @[];
     if ([maybeAnArray isKindOfClass [NSArray class]) {
        //Code probably be executed
     }
     这样判断的意思是，maybeAnArray这个对象是否是NSArray类族中的一员
     ** 使用类族的好处：可以把实现细节隐藏再一套简单的公共接口后面 **
     */
    
    //10、在既有类中使用关联对象存放自定义数据
    /*
     用关联对象可能会引入难于查找的bug，毕竟是在runtime阶段，所以可能要看情况谨慎选择
     */
    
    //11、理解“objc_msgSend”的作用
    /*
     1、在Objective-C中，如果向某个对象传递消息，那就会在运行时使用动态绑定（dynamic binding）机制来决定需要调用的方法。但是到了底层具体实现，却是普通的C语言函数实现的。这个实现的函数就是objc_msgSend,该函数定义如下：
     void objc_msgSend(id self, SEL cmd, ...)
     这是一个参数个数可变的函数，第一参数代表接收者，第二个参数代表选择子（OC函数名），后续的参数就是消息（OC函数调用）中的那些参数
     举例来说：
     id return = [git commit:parameter];
     上面的Objective-C方法在运行时会转换成如下函数：
     id return = objc_msgSend(git, @selector(commit), parameter);
     2、objc_msgSend函数会在接收者所属的类中搜寻其方法列表，如果能找到这个跟选择子名称相同的方法，就跳转到其实现代码，往下执行。若是当前类没找到，那就沿着继承体系继续向上查找，等找到合适方法之后再跳转 ，如果最终还是找不到，那就进入消息转发的流程去进行处理了。
     3、说过了OC的函数调用实现，你会觉得消息转发要处理很多，尤其是在搜索上，幸运的是objc_msgSend在搜索这块是有做缓存的，每个OC的类都有一块这样的缓存，objc_msgSend会将匹配结果缓存在快速映射表(fast map)中，这样以来这个类一些频繁调用的方法会出现在fast map 中，不用再去一遍一遍的在方法列表中搜索了。
     4、还有一个有趣的点，就是在底层处理发送消息的时候，有用到尾调用优化，大概原理就是在函数末尾调用某个不含返回值函数时，编译器会自动的不在栈空间上重新进行分配内存，而是直接释放所有调用函数内部的局部变量，然后直接进入被调用函数的地址。
     */
}



@end
