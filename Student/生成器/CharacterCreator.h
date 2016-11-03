//
//  CharacterCreator.h
//  Student
//
//  Created by pro on 16/10/27.
//  Copyright © 2016年 pro. All rights reserved.
//

#import <Foundation/Foundation.h>


@class Character;
@class Profession;

@interface CharacterCreator : NSObject


/**
 创建兽人角色
 */
- (Character *)createOrcPlayerWithProfession:(Profession *)profession;

/**
 创建人类角色
 */
- (Character *)createHumanPlayerWithProfession:(Profession *)profession;


@end
