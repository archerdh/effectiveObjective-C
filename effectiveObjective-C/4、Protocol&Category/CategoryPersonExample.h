//
//  CategoryPersonExample.h
//  effectiveObjective-C
//
//  Created by zheng zhang on 2018/5/9.
//  Copyright © 2018年 star. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryPersonExample : NSObject

@property (copy, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) NSArray *friends;

- (id)initWithName:(NSString *)name;

@end
