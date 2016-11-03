//
//  PP_PopOrPush.m
//  Student
//
//  Created by pro on 16/10/24.
//  Copyright © 2016年 pro. All rights reserved.
//

#import "PP_PopOrPush.h"
#define kScreenH [UIScreen mainScreen].bounds.size.height
#define kScreenW [UIScreen mainScreen].bounds.size.width
@interface PP_PopOrPush ()
{
    AnimatedScene _scenceStyle;
}

@end
@implementation PP_PopOrPush


- (instancetype)initWithStytle:(AnimatedScene)scene{
    
    if (self = [super init]) {
       
        _scenceStyle = scene;
        
    }
    
    return self;
}

#pragma mark UIViewControllerAnimatedTransitioning

//转场动画持续时间
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{

    return 1.0;
    
}

//具体的 转场动画
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{

    // 获取到 containerView视图 （我们动画发生的载体）
    UIView *containerView = [transitionContext containerView];
    // 我们要去的 View
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    // 从哪个 View 去的
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    switch (_scenceStyle)
    {
        case AnimatedScenePush:
        {// Push 动画 这里只是举个例子  动画效果可以自己去使用
            // 注意点： 一定要把目的视图（要去的 View） 添加到容器（containerView）上.
            [UIView animateWithDuration:1.0 animations:^{
                fromView.transform = CGAffineTransformMakeScale(0.5, 0.5);
            } completion:^(BOOL finished) {
                [containerView addSubview:toView];
                // 这个方法大概就是完成过渡动画，更新内部视图，控制器状态的转变！
                [transitionContext completeTransition:YES];
            }];
            
            NSLog(@"Push 动画效果");
        }
            break;
        case AnimatedScenePop:
        {
            // Pop 动画
            [UIView animateWithDuration:1.0 animations:^{
                // 让当前的二级页面  从下方消失
                fromView.frame = CGRectMake(0, kScreenH, kScreenW, kScreenH);
                
            } completion:^(BOOL finished) {
                
                [containerView addSubview:toView];
                
                [UIView animateWithDuration:1.0 animations:^{
                    // 让首级页面  由小变大
                    toView.transform = CGAffineTransformMakeScale(1, 1);
                    
                } completion:^(BOOL finished) {
                    
                    // 完成过度动画
                    [transitionContext completeTransition:YES];
                }];
            }];
            NSLog(@"Pop 动画效果");
            
        }
            
            break;
        case AnimatedScenePresent:
        {
            
            toView.frame = CGRectMake(kScreenW / 2.0 , kScreenH / 2.0, 0, 0);
            
            [containerView addSubview:toView];
            
            [UIView animateWithDuration:1.0 animations:^{
                
                toView.frame = CGRectMake(0 , 0, kScreenW, kScreenH);
                
            } completion:^(BOOL finished) {
                
                [transitionContext completeTransition:YES];
            }];
            
            NSLog(@"Present 动画效果");
            
            
        }
            break;
        case AnimatedSceneDissmiss:
        {
            
            [UIView animateWithDuration:1.0 animations:^{
                // 让当前的二级页面  从上方消失
                fromView.frame = CGRectMake(0, -kScreenH, kScreenW, kScreenH);
                
            } completion:^(BOOL finished) {
                
                [containerView addSubview:toView];
                // 完成过度动画
                [transitionContext completeTransition:YES];
                
            }];
            NSLog(@"Dissmiss 动画效果");
            
        }
            break;
            
        default:
            break;
    }

    
}
@end
