//
//  InvacationExample.m
//  effectiveObjective-C
//
//  Created by zheng zhang on 2018/3/8.
//  Copyright © 2018年 star. All rights reserved.
//

#import "InvacationExample.h"
#import <objc/runtime.h>
@interface InvacationExample ()

@property (strong, nonatomic) NSMutableDictionary *backingStore;

@end

@implementation InvacationExample
@dynamic string;

- (instancetype)init
{
    if (self = [super init]) {
        self.backingStore = [NSMutableDictionary new];
    }
    return self;
}

//第一步，询问是否有动态添加方法来进行处理
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"resolveInstanceMethod:  %@", NSStringFromSelector(sel));
    NSString *selectorStr = NSStringFromSelector(sel);
    if ([selectorStr hasPrefix:@"set"]) {
        class_addMethod(self, sel, (IMP)autoDictionarySetter, "v@:@");
        return YES;
    }
    else
    {
        class_addMethod(self, sel, (IMP)autoDictionartGetter, "@@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

//第二步，问问有没有别的类能够处理
- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"forwardingTargetForSelector:  %@", NSStringFromSelector(aSelector));
    return [super forwardingTargetForSelector: aSelector];
}

//第四步，通过anInvocation拿到相应信息做处理
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation: %@", NSStringFromSelector([anInvocation selector]));
}

//第三步，获取这个选择子的方法签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"method signature for selector: %@", NSStringFromSelector(aSelector));
    return [super methodSignatureForSelector:aSelector];
}

//都不行，会走这里；在这里处理crash
- (void)doesNotRecognizeSelector:(SEL)aSelector {
    NSLog(@"doesNotRecognizeSelector: %@", NSStringFromSelector(aSelector));
    [super doesNotRecognizeSelector:aSelector];
}

//getter
id autoDictionartGetter(id self, SEL _cmd)
{
    InvacationExample *typeSele = (InvacationExample *)self;
    NSMutableDictionary *backingStore = typeSele.backingStore;
    
    NSString *key = NSStringFromSelector(_cmd);
    return [backingStore objectForKey:key];
}

//setter
void autoDictionarySetter(id self, SEL _cmd, id value)
{
    InvacationExample *typeSele = (InvacationExample *)self;
    NSMutableDictionary *backingStore = typeSele.backingStore;
    NSString *selectStr = NSStringFromSelector(_cmd);
    NSMutableString *key = [selectStr mutableCopy];
    
    //remove ':'
    [key deleteCharactersInRange:NSMakeRange(key.length - 1, 1)];
    
    //remove 'set'
    [key deleteCharactersInRange:NSMakeRange(0, 3)];
    
    //replace firstChar
    NSString *lowerCaseFirstChar = [[key substringToIndex:1] lowercaseString];
    [key replaceCharactersInRange:NSMakeRange(0, 1) withString:lowerCaseFirstChar];
    
    if (value) {
        [backingStore setObject:value forKey:key];
    }
    else
    {
        [backingStore removeObjectForKey:key];
    }
}

@end
