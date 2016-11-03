//
//  Saber.m
//  Student
//
//  Created by pro on 16/10/27.
//  Copyright © 2016年 pro. All rights reserved.
//

#import "Saber.h"
#import "Character.h"
@implementation Saber


- (Profession *)buildStrength:(NSInteger)strength {
    
    [super buildStrength:strength];
    
    self.character.power += strength * 2;
    
    self.character.protection += strength * 2;
    
    return self;
}

- (Profession *)buildStamina:(NSInteger)stamina {
    
    [super buildStamina:stamina];
    
    self.character.power += stamina * 2;
    
    self.character.protection -= stamina * 1;
    
    return self;
}

- (Profession *)buildIntelligence:(NSInteger)intelligence {
    
    [super buildIntelligence:intelligence];
    
    self.character.power -= intelligence * 2;
    
    self.character.protection += intelligence * 2;
    
    return self;
}

- (Profession *)buildAgility:(NSInteger)agility {
    
    [super buildAgility:agility];
    
    self.character.power += agility * 1;
    
    self.character.protection -= agility * 1;
    
    return self;
}


@end
