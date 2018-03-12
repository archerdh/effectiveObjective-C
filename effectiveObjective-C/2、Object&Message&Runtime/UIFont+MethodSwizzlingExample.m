//
//  UIFont+MethodSwizzlingExample.m
//  effectiveObjective-C
//
//  Created by zheng zhang on 2018/3/9.
//  Copyright © 2018年 star. All rights reserved.
//

#import "UIFont+MethodSwizzlingExample.h"
#import <objc/runtime.h>
@implementation UIFont (MethodSwizzlingExample)

+ (void)load
{
    Method methodOld = class_getClassMethod(self, @selector(systemFontOfSize:));
    Method methodNew = class_getClassMethod(self, @selector(swizzling_systemFontOfSize:));
    method_exchangeImplementations(methodOld, methodNew);
}

+ (void)swizzling_systemFontOfSize:(CGFloat)size
{
    [self swizzling_systemFontOfSize:30];
}

@end
