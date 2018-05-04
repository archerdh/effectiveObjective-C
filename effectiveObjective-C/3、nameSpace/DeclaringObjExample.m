//
//  DeclaringObjExample.m
//  effectiveObjective-C
//
//  Created by zheng zhang on 2018/5/4.
//  Copyright © 2018年 star. All rights reserved.
//

#import "DeclaringObjExample.h"

@interface DeclaringObjExample ()

@property (strong, nonatomic) NSMutableSet *mutableFriends;

@end

@implementation DeclaringObjExample

- (id)initWithName:(NSString *)name AndFriends:(NSSet *)friends
{
    if (self = [super init]) {
        _name = name;
        _mutableFriends = [NSMutableSet setWithSet:friends];
    }
    return self;
}

- (NSString *)debugDescription
{
    return [NSString stringWithFormat:@"name --- %@", _name];
}

- (NSSet *)friends
{
    return [_mutableFriends copy];
}

 - (void)addFriend:(DeclaringObjExample *)person
{
    [_mutableFriends addObject:person];
}

- (void)removeFriend:(DeclaringObjExample *)person
{
    [_mutableFriends removeObject:person];
}

@end
