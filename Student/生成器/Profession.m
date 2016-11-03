//
//  Profession.m
//  Student
//
//  Created by pro on 16/10/27.
//  Copyright © 2016年 pro. All rights reserved.
//

#import "Profession.h"
#import "Character.h"

@interface Profession ()

@property (nonatomic , strong) Character * character;

@end
@implementation Profession

- (Profession *)buildNewCharacter {
    
    self.character = nil;
    self.character = [[Character alloc] init];
    
    return self;
}

- (Profession *)buildStrength:(NSInteger)strength {
    
    self.character.strength = strength;
    
    return self;
}

- (Profession *)buildStamina:(NSInteger)stamina {
    
    self.character.stamina = stamina;
    
    return self;
}

- (Profession *)buildIntelligence:(NSInteger)intelligence {
    
    self.character.intelligence = intelligence;
    
    return self;
}

- (Profession *)buildAgility:(NSInteger)agility {
    
    self.character.agility = agility;
    
    return self;
}

@end
