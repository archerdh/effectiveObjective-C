//
//  UILabel+MethodSwizzlingLabelExample.m
//  effectiveObjective-C
//
//  Created by zheng zhang on 2018/3/9.
//  Copyright © 2018年 star. All rights reserved.
//

#import "UILabel+MethodSwizzlingLabelExample.h"
#import <objc/runtime.h>
@implementation UILabel (MethodSwizzlingLabelExample)

+ (void)load
{
    Method methodOld = class_getInstanceMethod(self, @selector(setFont:));
    Method methodNew = class_getInstanceMethod(self, @selector(swizzling_setFont:));
    method_exchangeImplementations(methodOld, methodNew);
}

- (void)swizzling_setFont:(UIFont *)font
{
    font = [UIFont systemFontOfSize:30];
    [self swizzling_setFont:font];
}

@end
