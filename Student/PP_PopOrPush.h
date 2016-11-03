//
//  PP_PopOrPush.h
//  Student
//
//  Created by pro on 16/10/24.
//  Copyright © 2016年 pro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// 写个枚举判断使用的场景 Pop 还是 Push

typedef NS_OPTIONS(NSInteger, AnimatedScene) {

    AnimatedScenePush = 0,
    AnimatedScenePop,
    AnimatedScenePresent,
    AnimatedSceneDissmiss
    
};
@interface PP_PopOrPush : NSObject<UIViewControllerAnimatedTransitioning>

- (instancetype)initWithStytle:(AnimatedScene)scene;

@end
