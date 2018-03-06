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
    
}

@end
