//
//  ChildImageView.m
//  Student
//
//  Created by pro on 16/10/24.
//  Copyright © 2016年 pro. All rights reserved.
//

#import "ChildImageView.h"

@implementation ChildImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        NSLog(@"luguo");
    }
    
    return self;
}
- (void)shake{
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.duration = 0.05;
    animation.repeatCount = 5;
    animation.autoreverses = true;
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x - 4, self.center.y)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(self.center.x +4 , self.center.y)];
    [self.layer addAnimation:animation forKey:@"震动"];
    
    
}
@end
