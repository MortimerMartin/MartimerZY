//
//  Saber.h
//  Student
//
//  Created by pro on 16/10/27.
//  Copyright © 2016年 pro. All rights reserved.
//

#import "Profession.h"

@interface Saber : Profession

@end


@interface Saber (Override)

- (Profession *)buildStrength:(NSInteger)strength;
- (Profession *)buildStamina:(NSInteger)stamina;
- (Profession *)buildIntelligence:(NSInteger)intelligence;
- (Profession *)buildAgility:(NSInteger)agility;

@end
