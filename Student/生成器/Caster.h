//
//  Caster.h
//  Student
//
//  Created by pro on 16/10/27.
//  Copyright © 2016年 pro. All rights reserved.
//

#import "Profession.h"

@interface Caster : Profession

@end

@interface Caster (Override)

- (Profession *)buildStrength:(NSInteger)strength;
- (Profession *)buildStamina:(NSInteger)stamina;
- (Profession *)buildIntelligence:(NSInteger)intelligence;
- (Profession *)buildAgility:(NSInteger)agility;

@end
