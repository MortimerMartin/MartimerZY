//
//  Students.h
//  Student
//
//  Created by pro on 16/10/18.
//  Copyright © 2016年 pro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Students : NSObject<NSCoding>

@property (nonatomic , assign) NSInteger number;

@property (nonatomic , copy) NSString * name;

@property (nonatomic , copy) NSString * sex;


+ (void)saveStudents:(Students *)student;

+ (Students *)loadData;

@end
