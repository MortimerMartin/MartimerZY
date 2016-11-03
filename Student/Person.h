//
//  Person.h
//  Student
//
//  Created by pro on 16/10/19.
//  Copyright © 2016年 pro. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol PersonDelegate <NSObject>

@optional

- (void)test:(id)anything didFinishAnything:(id)anyting1;

@end


typedef void(^Block)(NSString * text);
@interface Person : NSObject<NSCopying,NSMutableCopying>


@property (nonatomic , strong) NSString * name;

@property (nonatomic , strong) NSString * userID;

@property (nonatomic , strong) NSString * sex;




@property (nonatomic , copy) void(^Block)(NSString * text);

@property (nonatomic , copy) Block block;


@property (nonatomic , weak) id <PersonDelegate> delegate;

+(instancetype)sharePerson;
@end
