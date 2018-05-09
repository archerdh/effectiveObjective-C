//
//  NameSpace.m
//  effectiveObjective-C
//
//  Created by zheng zhang on 2018/3/9.
//  Copyright © 2018年 star. All rights reserved.
//

#import "NameSpace.h"
#import "NameSpaceExample.h"
#import "DeclaringObjExample.h"

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
    /*
     如果创建类的实例的方式不止一种，那么这个类就会有多个初始化方法，这样做很好，不过还是要在其中选定一个方法作为全能初始化方法，剩下的其余的初始化方法都要调用它，这样做的好处是以后如果初始化的逻辑更改了只需更改一处即可，或者是交给子类覆写的时候也只覆写这一个方法即可~
     举个例子来说:可以看一下NSDate的实现在NSDate.h中NSDate类中定义了一个全能初始化方法：
     - (instancetype)initWithTimeIntervalSinceReferenceDate:(NSTimeInterval)ti NS_DESIGNATED_INITIALIZER;
     */
    
    //17、实现description方法
    /*
     通过覆写description方法或者debugDescription方法来在NSLog打印时或者LLDB打印时输出更多的自定义信息。(数据和字典的可以通过覆写descriptionWithLocale:方法)
     */
    
    //18、尽量使用不可变对象
    /*
     尽量使用不可变的对象，也就是在对外属性声明的时候要尽量加上readonly修饰，默认是readwrite，这样一来，在外部就只能读取该数据，而不能修改它，使得这个类的实例所持有的数据更加安全。如果外部想要修改，可以提供方法来进行修改。
     不要把可变的collection作为属性公开，而应提供相关方法，以此修改对象中的可变collection
     */
//    DeclaringObjExample *onePerson = [[DeclaringObjExample alloc] initWithName:@"小明" AndFriends:nil];
//    DeclaringObjExample *declarExample = [[DeclaringObjExample alloc] initWithName:@"万里" AndFriends:[NSSet setWithObjects:onePerson, nil]];
//    [declarExample removeFriend:onePerson];
    
    //19、使用清晰而协调的命名方式
    
    //20、为私有方法名加前缀
    /*
     该为类内的私有方法增加前缀，以便区分
     */
    
    //21、理解Objective-C错误模型
    /*
     最好微程序库中所发生的错误指定一个专用的错误范围字符串，使用此字符串创建nserror对象，并将其返回给库的使用者
     */
    
    //22、理解NSCopying协议
    /*
     在拷贝对象时，需要注意拷贝执行的是浅拷贝还是深拷贝。深拷贝在拷贝对象时，会将对象的底层数据也进行了拷贝。浅拷贝是创建了一个新的对象指向要拷贝的内容。一般情况应该尽量执行浅拷贝。
     */
    
    
}

- (void)soundPlayerDidFinished:(NameSpaceExample *)player
{
    
}

@end
