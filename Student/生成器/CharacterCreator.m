//
//  CharacterCreator.m
//  Student
//
//  Created by pro on 16/10/27.
//  Copyright © 2016年 pro. All rights reserved.
//

#import "CharacterCreator.h"
#import "Character.h"
#import "Profession.h"


@implementation CharacterCreator


/**
 创建兽人角色
 */
- (Character *)createOrcPlayerWithProfession:(Profession *)profession {
    
    return [[[[[profession  buildNewCharacter]
               buildStrength:30]
              buildStamina:30]
             buildIntelligence:20]
            buildAgility:20].character;
    
}

/**
 创建人类角色
 */
- (Character *)createHumanPlayerWithProfession:(Profession *)profession {
    
    return [[[[[profession  buildNewCharacter]
               buildStrength:20]
              buildStamina:20]
             buildIntelligence:30]
            buildAgility:30].character;
    
}


@end
