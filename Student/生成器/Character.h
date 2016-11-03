//
//  Character.h
//  Student
//
//  Created by pro on 16/10/27.
//  Copyright © 2016年 pro. All rights reserved.
//

#import <Foundation/Foundation.h>
//角色
@interface Character : NSObject

// 攻击力
@property (nonatomic, assign) NSInteger protection;
// 防御力
@property (nonatomic, assign) NSInteger power;
// 力量
@property (nonatomic, assign) NSInteger strength;
// 耐力
@property (nonatomic, assign) NSInteger stamina;
// 智力
@property (nonatomic, assign) NSInteger intelligence;
// 敏捷
@property (nonatomic, assign) NSInteger agility;

@end
