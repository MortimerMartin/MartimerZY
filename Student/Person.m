//
//  Person.m
//  Student
//
//  Created by pro on 16/10/19.
//  Copyright © 2016年 pro. All rights reserved.
//

#import "Person.h"

@implementation Person

// 01 提供静态变量

static Person * _person;

// 02 重写allocWithZone方法

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _person = [super allocWithZone:zone];
    });
    
    
   
    return _person;
}


// 03 提供类方法

+ (instancetype)sharePerson{
    
  

    return [[self alloc] init];
}

// 04 更严谨的做法

- (id)copyWithZone:(NSZone *)zone{
    return _person;
}

- (id)mutableCopyWithZone:(NSZone *)zone{
    return _person;
}
@end
