//
//  ServiceSlider.m
//  Student
//
//  Created by pro on 16/11/1.
//  Copyright © 2016年 pro. All rights reserved.
//

#import "ServiceSlider.h"
#import "UIView+CLExtension.h"
//5,5s的设备
#define kDevice_Is_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define kSCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
@implementation ServiceSlider


#pragma mark 订单状态滚动视图
- (UIScrollView * )buttomScrollView{
    if (!_buttomScrollView) {
        _buttomScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _buttomScrollView.backgroundColor = [UIColor blueColor];
        _buttomScrollView.bounces = NO;//拖动到边界是否有弹性
        _buttomScrollView.pagingEnabled = YES;
        _buttomScrollView.showsHorizontalScrollIndicator = NO;
        _buttomScrollView.delegate = self;
        _buttomScrollView.layer.cornerRadius = (kDevice_Is_iPhone5 ? 40 : 48) * 0.5;
        _buttomScrollView.layer.masksToBounds = YES;
        _buttomScrollView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _buttomScrollView;
    
}

#pragma mark 滑动更换点击弹出视图
- (UIImageView * )popView{
    if (!_popView) {
        _popView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -60, kSCREEN_WIDTH - 30, 55)];
        UIImage * currentImage = [UIImage imageNamed:@"bubble_pop"];
        _popView.image = [currentImage stretchableImageWithLeftCapWidth:100 topCapHeight:51];
        _popView.hidden = YES;
        UILabel * alertLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 3, kSCREEN_WIDTH - 40, 45)];
        alertLabel.text = @"为防止您误操作，我们已将点击按钮改为滑动按钮，请您向右滑试试看！";
        alertLabel.numberOfLines = 0;
        alertLabel.textColor = [UIColor whiteColor];
        alertLabel.font = [UIFont systemFontOfSize:14.0];
        [_popView addSubview:alertLabel];
    }
    
    return _popView;

}


- (void)showAlert{
    _popView.hidden = _isShow;
    _isShow = !_isShow;
}

- (void)dismissAlert{
    _popView.hidden = YES;
}


#pragma mark 滚动视图代理处理事件
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self dismissAlert];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    _isShow = NO;
    
}


#pragma mark 根据状态更改滑块显示
- (void)changeSliderStateForType:(SERVICE_STATE)state{

    dispatch_async(dispatch_get_main_queue(), ^{
        switch (state) {
            case SERVICE_READY:
                
                break;
                
            case SERVICE_ARRIVED:
                
                break;
                
            case SERVICE_START:
                
                break;
                
            case SERVICE_END:
                
                break;
                
            default:
                break;
        }
    });
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
