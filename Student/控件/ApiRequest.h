//
//  ApiRequest.h
//  Student
//
//  Created by pro on 16/11/1.
//  Copyright © 2016年 pro. All rights reserved.
//

#import "YTKRequest.h"

@interface ApiRequest : YTKRequest


@property (nonatomic, strong) NSString *httpMethod;
@property (nonatomic, strong) NSString *requestUrl;
@property (nonatomic, strong) NSDictionary *requestParamters;

+ (instancetype)doRequest:(NSString *)requestUrl withParameter:(NSDictionary *)parameters;

@end
