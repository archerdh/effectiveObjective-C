//
//  DeclaringObjExample.h
//  effectiveObjective-C
//
//  Created by zheng zhang on 2018/5/4.
//  Copyright © 2018年 star. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeclaringObjExample : NSObject

@property (copy, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) NSSet *friends;

- (id)initWithName:(NSString *)name AndFriends:(NSSet *)friends;

- (void)addFriend:(DeclaringObjExample *)person;

- (void)removeFriend:(DeclaringObjExample *)person;

@end
