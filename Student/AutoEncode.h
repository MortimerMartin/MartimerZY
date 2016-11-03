//
//  AutoEncode.h
//  Student
//
//  Created by pro on 16/10/24.
//  Copyright © 2016年 pro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AutoEncode : NSObject<NSCoding>

@property (nonatomic , copy) NSString * name;

@property (nonatomic , copy) NSString * sex;

@property (nonatomic , assign) NSInteger userID;

- (void)saveInfo;

- (AutoEncode *)readInfo;
@end
