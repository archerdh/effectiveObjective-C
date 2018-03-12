//
//  NameSpaceExample.m
//  effectiveObjective-C
//
//  Created by zheng zhang on 2018/3/9.
//  Copyright © 2018年 star. All rights reserved.
//

#import "NameSpaceExample.h"
#import <AudioToolbox/AudioToolbox.h>

void completion(SystemSoundID ssID, void *clientData)
{
    NameSpaceExample *player = (__bridge NameSpaceExample *)clientData;
    if ([player.delegate respondsToSelector:@selector(soundPlayerDidFinished:)]) {
        [player.delegate soundPlayerDidFinished:player];
    }
}

@implementation NameSpaceExample
{
    SystemSoundID _systemSoundID;
}

- (id)initWithUrl:(NSURL *)url
{
    if (self = [super init]) {
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &_systemSoundID);
    }
    return self;
}

- (void)dealloc
{
    AudioServicesDisposeSystemSoundID(_systemSoundID);
}

- (void)playSound
{
    AudioServicesAddSystemSoundCompletion(_systemSoundID, NULL, NULL, completion, (__bridge void *)self);
    AudioServicesPlaySystemSound(_systemSoundID);
}

@end
