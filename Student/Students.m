//
//  Students.m
//  Student
//
//  Created by pro on 16/10/18.
//  Copyright © 2016年 pro. All rights reserved.
//

#import "Students.h"



#define kAccountFile  @"student"
@implementation Students



+ (void)saveStudents:(Students *)student{

    //Documents路径
    NSString * path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString * filePath = [path stringByAppendingPathComponent:kAccountFile];
    
    NSLog(@"%@",filePath);
    [NSKeyedArchiver archiveRootObject:student toFile:filePath];
    
}

+ (Students *)loadData{
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [path stringByAppendingPathComponent:kAccountFile];
    
    return [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
}


#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:[NSNumber numberWithInteger:self.number] forKey:@"number"];
    
    [aCoder encodeObject:self.name forKey:@"name"];
    
    [aCoder encodeObject:self.sex forKey:@"sex"];
    
}


- (id)initWithCoder:(NSCoder *)aDecoder{

    
    if (self = [super init]) {
        
        self.number = [[aDecoder decodeObjectForKey:@"number"] integerValue];
        
        self.name = [aDecoder decodeObjectForKey:@"name"];
        
        self.sex = [aDecoder decodeObjectForKey:@"sex"];
    }
    
    return self;
}


//- (void)dealloc{
//
////    self.number = nil;
//    self.name = nil;
//    self.sex = nil;
//
//NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
//NSString *filePath = [path stringByAppendingPathComponent:kAccountFile];
//[[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
//    //删除归档的文件
//
//    
//    NSLog(@"释放");
//}
@end
