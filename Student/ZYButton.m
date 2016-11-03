//
//  ZYButton.m
//  Student
//
//  Created by pro on 16/10/24.
//  Copyright © 2016年 pro. All rights reserved.
//

#import "ZYButton.h"

@interface ZYButton ()

@property (nonatomic , assign) BOOL flag;

@end

@implementation ZYButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{

    if (!self.flag) {
        [super sendAction:action to:target forEvent:event];
        self.flag = !self.flag;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.flag = !self.flag;
        });
        
    } else {
    
        return ;
    }

}


@end
