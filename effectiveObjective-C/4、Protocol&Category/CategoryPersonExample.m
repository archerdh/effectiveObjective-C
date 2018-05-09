//
//  CategoryPersonExample.m
//  effectiveObjective-C
//
//  Created by zheng zhang on 2018/5/9.
//  Copyright © 2018年 star. All rights reserved.
//

#import "CategoryPersonExample.h"

@implementation CategoryPersonExample
{
    NSMutableArray *person_friends;
}

- (id)initWithName:(NSString *)name
{
    if (self = [super init]) {
        _name = [name copy];
        person_friends = [NSMutableArray array];
    }
    return self;
}

@end
