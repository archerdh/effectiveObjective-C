//
//  MethodSwizzlingExampleView.m
//  effectiveObjective-C
//
//  Created by zheng zhang on 2018/3/9.
//  Copyright © 2018年 star. All rights reserved.
//

#import "MethodSwizzlingExampleView.h"
#import "UIFont+MethodSwizzlingExample.h"
#import "UILabel+MethodSwizzlingLabelExample.h"
@implementation MethodSwizzlingExampleView

+ (id)methodView
{
   return [[[NSBundle mainBundle] loadNibNamed:@"MethodSwizzlingExampleView" owner:nil options:nil] lastObject];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 20)];
    textLabel.text = @"代码测试字体";
    textLabel.font = [UIFont systemFontOfSize:15];
    textLabel.textColor = [UIColor blackColor];
    [self addSubview:textLabel];
}

@end
