//
//  ApiRequest+Core.m
//  Student
//
//  Created by pro on 16/11/1.
//  Copyright © 2016年 pro. All rights reserved.
//

#import "ApiRequest+Core.h"

@implementation ApiRequest (Core)

- (NSURLRequest *)buildCustomUrlRequest
{
    NSString *url = [NSString stringWithFormat:@"%@",[self requestUrl]];
    
    //    NSLog(@"请求的地址信息为:%@", url);
    //
    //    NSLog(@"请求的参数为:%@",[self requestParamters]);
    
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    
//    if ([self httpMethod] == nil) {
        request.HTTPMethod = @"Post";
//    } else {
//        request.HTTPMethod = @"Get";
//    }
    
    NSData *httpbody = [NSJSONSerialization dataWithJSONObject:[self requestParamters] options:NSJSONWritingPrettyPrinted error:nil];
    
    [request addValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
    [request setHTTPBody:httpbody];
    
    request.timeoutInterval = 15;
    
    return request;
}

- (void)requestCompleteFilter
{
    //    NSLog(@"获取_JSON_: %@", self.responseJSONObject);
    
    NSDictionary *dic = self.responseJSONObject;
    
    NSInteger status = [dic[@"status"]integerValue];
    
    if (status == 0)
    {
        //        [SVProgressHUD showErrorWithStatus:dic[@"message"]];
      
        if (self.failureCompletionBlock) {
            self.failureCompletionBlock(self);
        }
        
        [self stop];
    }
    else
    {
        NSLog(@"失败");
    }
}

- (void)requestFailedFilter
{
    NSLog(@"网络不给力");
    //    [SVProgressHUD showErrorWithStatus:@"网络不给力，请稍后试试"];
}

- (NSInteger)cacheTimeInSeconds
{
    return 60;
}


@end
