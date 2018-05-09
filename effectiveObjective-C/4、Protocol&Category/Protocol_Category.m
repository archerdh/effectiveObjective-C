//
//  Protocol_Category.m
//  effectiveObjective-C
//
//  Created by zheng zhang on 2018/5/9.
//  Copyright © 2018年 star. All rights reserved.
//

#import "Protocol_Category.h"

@implementation Protocol_Category

+ (void)getMessage
{
    //23、通过委托与数据源协议进行对象间通信
    /*
     当某对象需要从另外一个对象中获取数据时，可以使用委托模式，这种用法经常被称为“数据源协议”（Data source Protocal）类似 UITableview的UITableViewDataSource
     另外在Swift中有一个很重要的思想就是面向协议编程。当然OC中也可以用协议来降低代码耦合性，必要的时候也可以替代继承，因为遵循同一个协议的类可以是任何，不必是同一个继承体系下。
     */
    
    //24、将类的实现代码分散到便于管理的数个分类之中
    /*
     通过分类机制，可以把类分成很多歌易于管理的小块。也是有一些前提的吧，可能是这个类业务比较复杂，需要瘦身，需要解耦等等。作者还推荐把私有方法统一放在Private分类中，以隐藏实现细节。
     */
    
    //25、总是为第三方类的分类名称加前缀
    /*
     顾名思义，eg
     - (NSString *)abc_urlEncodeString;
     */
    
    //26、勿在分类中声明属性
    /*
     把封装数据所用的全部属性都定义在主接口里，不要在分类中声明属性
     */
    
    //27、使用“class-continuation”分类隐藏实现细节
    
}

@end
