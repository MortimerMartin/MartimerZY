//
//  ApiRequest.m
//  Student
//
//  Created by pro on 16/11/1.
//  Copyright © 2016年 pro. All rights reserved.
//

#import "ApiRequest.h"

@implementation ApiRequest


+ (instancetype)doRequest:(NSString *)requestUrl withParameter:(NSDictionary *)parameters
{

    ApiRequest *request = [[ApiRequest alloc]init];
    
    request.requestParamters = parameters;
    
    request.requestUrl = requestUrl;
    
    return request;
}

@end
