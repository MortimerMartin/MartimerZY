//
//  AutoEncode.m
//  Student
//
//  Created by pro on 16/10/24.
//  Copyright © 2016年 pro. All rights reserved.
//

#import "AutoEncode.h"

#import <objc/runtime.h>
@implementation AutoEncode



- (AutoEncode *)readInfo{

    NSString * path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    
    NSString *filePath = [path stringByAppendingString:NSStringFromClass([AutoEncode class])];
    
 return  [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];

}


-(void)saveInfo{
    
    NSString * path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    
    NSString *filePath = [path stringByAppendingString:NSStringFromClass([AutoEncode class])];
    
    NSLog(@"%@",filePath);
    [NSKeyedArchiver archiveRootObject:self toFile:filePath];
}

/**
 *  存
 *
 *  @param
 *  @param
 *  @param
 */
- (void)encodeWithCoder:(NSCoder *)aCoder{

    unsigned int count = 0 ;
    
    Ivar * ivars = class_copyIvarList([AutoEncode class], &count);
    
    for (int i = 0 ; i < count ; i++) {
        
        Ivar ivar = ivars[i];
        
        const char * name = ivar_getName(ivar);
        
        NSString * key = [NSString stringWithUTF8String:name];
        
        id value = [self valueForKey:key];
        
        [aCoder encodeObject:value forKey:key];
    }
    
    free(ivars);
    
}

/**
 *  取
 *
 *  @param
 *  @param
 *  @param
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if (self = [super init]) {
        
        unsigned int count = 0;
        
        Ivar * ivars = class_copyIvarList([AutoEncode class], &count);
        
        for (int i = 0; i < count; i++) {
            
            Ivar ivar = ivars[i];
            
            const char * name = ivar_getName(ivar);
            
            NSString * key = [NSString stringWithUTF8String:name];
            
            id value = [aDecoder decodeObjectForKey:key];
            
            [self setValue:value forKey:key];
        }
        
        free(ivars);
        
    }
    
    return self;

}
@end
