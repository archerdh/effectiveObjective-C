//
//  CategoryPersonNormalExample.h
//  effectiveObjective-C
//
//  Created by zheng zhang on 2018/5/9.
//  Copyright © 2018年 star. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryPersonNormalExample : NSObject

@property (copy, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) NSArray *friends;

- (id)initWithName:(NSString *)name;

//friends method
- (void)addFried:(CategoryPersonNormalExample *)person;
- (void)removeFried:(CategoryPersonNormalExample *)person;
- (BOOL)isFriendWith:(CategoryPersonNormalExample *)person;

//work method
- (void)performDaysWork;
- (void)takeVacationFromWork;

//play method
- (void)goToTheChina;
- (void)goToSportGame;

@end
