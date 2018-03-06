//
//  StrongCopyExample.m
//  effectiveObjective-C
//
//  Created by zheng zhang on 2018/3/6.
//  Copyright © 2018年 star. All rights reserved.
//

#import "StrongCopyExample.h"

@interface StrongCopyExample ()

@property (nonatomic, strong) NSString *name;
//@property (nonatomic, copy) NSString *name;

@end

@implementation StrongCopyExample

- (instancetype)init
{
    if (self = [super init]) {
        NSMutableString *mStr = [NSMutableString stringWithString:@"张三"];
        self.name = mStr;
        
        NSLog(@"使用strong第一次得到的名字:%@", self.name);
        [mStr appendFormat:@"疯"];
        NSLog(@"使用strong第二次得到的名字:%@", self.name);

        /*
         使用strong后self.name和mStr指向同一个内存地址，所以修改其中一个两个值都会变化
         在没有修改self.name的情况下，值却被修改了，就好像一个人的名字没经过自己的同意就修改了一样；
         初衷只是想要修改mStr，淡水self.name意外被改，这就是我们所不希望看到的，他会破坏封装性。
         */
        
        self.name = @"王五";
        NSLog(@"使用strong第三次得到的名字:%@", self.name);
    }
    return self;
}

@end
