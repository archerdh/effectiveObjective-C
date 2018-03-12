//
//  ViewController.m
//  effectiveObjective-C
//
//  Created by zhangzheng on 2018/3/6.
//  Copyright © 2018年 star. All rights reserved.
//

#import "ViewController.h"
#import "Object_Message_Runtime.h"
#import "MethodSwizzlingExampleView.h"
#import "NameSpace.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [Object_Message_Runtime getMessage];
    MethodSwizzlingExampleView *view = [MethodSwizzlingExampleView methodView];
    [self.view addSubview:view];
    
    NameSpace *nameSpace = [NameSpace new];
    [nameSpace getMessage];
}

@end
