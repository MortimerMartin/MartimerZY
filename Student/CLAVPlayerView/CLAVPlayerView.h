//
//  CLAVPlayerView.h
//  Student
//
//  Created by pro on 16/10/28.
//  Copyright © 2016年 pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLAVPlayerView : UIView

/** 需要播放的视频资源 */
@property (nonatomic , copy) NSString * urlString;

/* 包含在哪一个控制器中 */
@property (nonatomic , weak) UIViewController * sonViewController;

/** 快速创建 */
+(instancetype)videoPlayView;

@end
