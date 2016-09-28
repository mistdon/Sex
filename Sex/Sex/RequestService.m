//
//  RequestService.m
//  Sex
//
//  Created by Shendong on 16/9/28.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "RequestService.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <AFNetworking/AFNetworking.h>

@implementation RequestService
- (RACSignal *)requretWithUrl:(NSString *)url withParameters:(NSDictionary *)paramters{
    NSParameterAssert(url);
    RACReplaySubject *subject = [RACReplaySubject subject];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    [manager GET:url parameters:paramters progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (![responseObject isKindOfClass:[NSDictionary class]])return;
        if ([responseObject[@"Code"]  integerValue] != 0) {
            [subject sendError:[NSError errorWithDomain:@"Sex" code:1001 userInfo:@{@"info":@"Wrong"}]];
            return;
        }
        [subject sendNext:responseObject[@"data"]];
        [subject sendCompleted];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [subject sendError:error];
    }];
    return  subject;
}
@end
