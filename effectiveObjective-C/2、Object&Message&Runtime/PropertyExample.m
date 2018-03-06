//
//  PropertyExample.m
//  effectiveObjective-C
//
//  Created by zheng zhang on 2018/3/6.
//  Copyright © 2018年 star. All rights reserved.
//

#import "PropertyExample.h"

@interface PropertyExample ()

@property (nonatomic, strong) NSArray *arrayOfStrong;
@property (nonatomic, copy) NSArray *arrayOfCopy;
@property (nonatomic, copy) NSArray *arrayOfCopy2;
@property (nonatomic, strong) NSMutableArray *mutableArrayOfStrong;
@property (nonatomic, copy) NSMutableArray *mutableArrayOfCopy;

@end


@implementation PropertyExample

- (instancetype)init
{
    if (self = [super init]) {
        NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithArray:@[@"A"]];
        NSLog(@"mutableArray地址为 %p", mutableArray);
        self.arrayOfStrong = mutableArray;
        self.arrayOfCopy = mutableArray;
        //如果是_赋值，相当于指针指向；并不是set赋值，锁死
        _arrayOfCopy2 = mutableArray;
//        self.arrayOfCopy2 = mutableArray;

        [mutableArray addObject:@"B"];
        NSLog(@"arrayOfStrong:%@ 地址为%p",_arrayOfStrong, _arrayOfStrong);
        NSLog(@"arrayOfCopy:%@ 地址为%p",_arrayOfCopy, _arrayOfCopy);
        NSLog(@"arrayOfCopy2:%@ 地址为%p", _arrayOfCopy2, _arrayOfCopy2);
        
        
        NSLog(@"------------------------------------------------------");
        
        self.mutableArrayOfStrong = mutableArray;
        [_mutableArrayOfStrong addObject:@"C"];
        
        self.mutableArrayOfCopy = mutableArray;
        [_mutableArrayOfStrong addObject:@"D"];

        NSLog(@"mutableArrayOfStrong:%@ 地址为%p",_mutableArrayOfStrong, _mutableArrayOfStrong);
        NSLog(@"mutableArrayOfCopy's class is %@", [_mutableArrayOfCopy class]);
        
        //结论，应该这么声明
//        @property (nonatomic, copy) NSArray *arrayOfCopy;
//        @property (nonatomic, strong) NSMutableArray *mutableArrayOfStrong;
    }
    return self;
}

@end
