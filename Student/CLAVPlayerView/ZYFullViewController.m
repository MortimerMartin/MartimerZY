//
//  ZYFullViewController.m
//  Student
//
//  Created by pro on 16/10/28.
//  Copyright © 2016年 pro. All rights reserved.
//

#import "ZYFullViewController.h"

@interface ZYFullViewController ()

@end

@implementation ZYFullViewController



- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    
    return UIInterfaceOrientationMaskLandscape;
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_queue_t queue1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);//queue1:中（默认）优先级的全局并行队列
    
    dispatch_queue_t queue2 = dispatch_get_main_queue();  //queue2:主队列
    dispatch_queue_t queue3 = dispatch_queue_create("queue3", NULL);//queue3:未指定type则为串行队列
    dispatch_queue_t queue4 = dispatch_queue_create("queue4", DISPATCH_QUEUE_SERIAL);//queue4:指定串行队列
    dispatch_queue_t queue5 = dispatch_queue_create("queue5", DISPATCH_QUEUE_CONCURRENT);//queue5:指定并行队列
    
    
    // 队列中添加异步任务
    dispatch_async(queue1, ^{
        // 任务
       
    });
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
