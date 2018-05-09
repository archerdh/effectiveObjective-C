//
//  CategoryPersonNormalExample.m
//  effectiveObjective-C
//
//  Created by zheng zhang on 2018/5/9.
//  Copyright © 2018年 star. All rights reserved.
//

#import "CategoryPersonNormalExample.h"

@implementation CategoryPersonNormalExample
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

- (void)addFried:(CategoryPersonNormalExample *)person
{
    if (![person_friends containsObject:person]) {
        [person_friends addObject:person];
    }
}

- (void)removeFried:(CategoryPersonNormalExample *)person
{
    if ([person_friends containsObject:person]) {
        [person_friends removeObject:person];
    }
}

- (BOOL)isFriendWith:(CategoryPersonNormalExample *)person
{
    return [person_friends containsObject:person];
}

- (void)performDaysWork
{
    
}

- (void)takeVacationFromWork
{
    
}

- (void)goToTheChina
{
    
}

- (void)goToSportGame
{
    
}

@end
