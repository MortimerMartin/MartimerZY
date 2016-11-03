//
//  ZYButton.h
//  Student
//
//  Created by pro on 16/10/24.
//  Copyright © 2016年 pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYButton : UIButton


/**
 *  防止btn多次点击
 *
 *  @param action  方法名
 *  @param
 *  @param event 触发的事件
 */

- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event;
@end
