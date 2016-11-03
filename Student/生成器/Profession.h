//
//  Profession.h
//  Student
//
//  Created by pro on 16/10/27.
//  Copyright © 2016年 pro. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Character;
//职业
@interface Profession : NSObject


/**
 最后所生成的角色（Character）
 */
@property (nonatomic, strong, readonly) Character *character;


/**
 初始化并且创建一个新的职业
 */
- (Profession *)buildNewCharacter;


@end


@interface Profession (Attribute)


- (Profession *)buildStrength:(NSInteger)strength;
- (Profession *)buildStamina:(NSInteger)stamina;
- (Profession *)buildIntelligence:(NSInteger)intelligence;
- (Profession *)buildAgility:(NSInteger)agility;


@end
