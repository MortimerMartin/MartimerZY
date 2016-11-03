//
//  NSObject+ExchangeMethod.m
//  Student
//
//  Created by pro on 16/10/27.
//  Copyright © 2016年 pro. All rights reserved.
//

#import "NSObject+ExchangeMethod.h"
#import <objc/message.h>
#define kAccountFile  @"student"
@implementation NSObject (ExchangeMethod)


////此方法会在此类第一次被加载进内存时调用，切仅调用一次
//+(void)load{
//
//    //在arc机制下 @selector（dealloc）会编译on报错，所以转为NSSelectorFromString（@“dealloc”）
//    //获得系统的delloc方法
//    Method m1 = class_getInstanceMethod(self, NSSelectorFromString(@"dealloc"));
//    //获得自己的声明my_dealloc
//    Method m2 = class_getInstanceMethod(self, @selector(my_dealloc));
//    //交换两个方法的实现，即调用系统的delloc方法会实现my_dealloc，调用my——dealloc才是调用系统的dealloc
//    method_exchangeImplementations(m1, m2);
//    
//}
//
//- (void)my_dealloc{
//
//
//    
//    NSLog(@"我被释放了");
//    
//    [self my_dealloc];
//}



@end
