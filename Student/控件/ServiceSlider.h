//
//  ServiceSlider.h
//  Student
//
//  Created by pro on 16/11/1.
//  Copyright © 2016年 pro. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef NS_ENUM(NSInteger, SERVICE_STATE) {

    SERVICE_READY,
    SERVICE_ARRIVED,
    SERVICE_START,
    SERVICE_END


};


@interface ServiceSlider : UIView<UIScrollViewDelegate>

/**
 *  底部状态滚动视图
 */
@property (nonatomic , strong) UIScrollView * buttomScrollView;

/**
 *  滑动更改点击弹出式图
 */
@property (nonatomic , strong) UIImageView * popView;

/**
 *  视图弹出状态
 */
@property (nonatomic , assign) BOOL isShow;

/**
 *  触发状态改变
 */
@property (nonatomic , copy) void(^serviceStateChange)(SERVICE_STATE);

/**
 *  根据订单状态显示对应滑块状态
 */
- (void)sliderStateForType:(SERVICE_STATE)state;

@end
