//
//  NameSpaceExample.h
//  effectiveObjective-C
//
//  Created by zheng zhang on 2018/3/9.
//  Copyright © 2018年 star. All rights reserved.
//  命名空间示例

#import <Foundation/Foundation.h>

@class NameSpaceExample;

@protocol NameSpaceExampleDelegate<NSObject>

- (void)soundPlayerDidFinished:(NameSpaceExample *)player;

@end

@interface NameSpaceExample : NSObject

@property (assign, nonatomic) id<NameSpaceExampleDelegate> delegate;

- (id)initWithUrl:(NSURL *)url;

- (void)playSound;

@end
