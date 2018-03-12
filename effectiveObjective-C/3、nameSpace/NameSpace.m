//
//  NameSpace.m
//  effectiveObjective-C
//
//  Created by zheng zhang on 2018/3/9.
//  Copyright © 2018年 star. All rights reserved.
//

#import "NameSpace.h"
#import "NameSpaceExample.h"

@interface NameSpace ()<NameSpaceExampleDelegate>

@end


@implementation NameSpace

- (void)getMessage
{
    //15、用前缀避免命名空间冲突
    /*
     apple保留所有使用“两个字母前缀”的权利，所以项目使用中应该至少前缀三个字母。
     eg.公司，项目或者二者皆有关联之名
     */
#warning 这个示例没搞懂!
//    NameSpaceExample *nameSpace = [[NameSpaceExample alloc] initWithUrl:[NSURL URLWithString:@"http://up.mcyt.net/down/45913.mp3"]];
//    nameSpace.delegate = self;
//    [nameSpace playSound];
    
    //16、提供全能初始化方法
}

- (void)soundPlayerDidFinished:(NameSpaceExample *)player
{
    
}

@end
