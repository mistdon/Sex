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



NSString *const KQuerylunbo = @"http://api.qinglvmao.com/index/lunbo";

NSString *const KSearch = @"http://api.qinglvmao.com/category/clist/?cid=3&page=1&pn=10&sort=&by=&umeng=0";


static NSString *KBaseurl = @"http://api.qinglvmao.com";

@implementation RequestService
- (RACSignal *)requretWithUrl:(NSString *)url withParameters:(NSDictionary *)paramters{
    NSAssert(!url || url.length > 0, @"Request url invalid");
    RACReplaySubject *subject = [RACReplaySubject subject];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:KBaseurl]];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    [manager GET:url parameters:paramters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if (![responseObject isKindOfClass:[NSDictionary class]])return;
        if ([responseObject[@"code"]  integerValue] != 0) {
            [subject sendError:[NSError errorWithDomain:@"Sex" code:[responseObject[@"code"] integerValue]  userInfo:@{@"info":@"Wrong"}]];
            return;
        }
        [subject sendNext:responseObject[@"data"]];
        [subject sendCompleted];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [subject sendError:error];
    }];
    return  subject;
}

static NSString *const KAppkey = @"7b9e3897a3a5ba97cb39a265011a41ca";
- (RACSignal *)testRequest{
    
    RACReplaySubject *subject = [RACReplaySubject subject];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:KAppkey forHTTPHeaderField:@"apikey"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",nil];
    NSString *url = @"http://apis.baidu.com/txapi/weixin/wxhot";
    NSDictionary *paramters = @{@"num":@10,@"rand":@1,@"word":@"理财",@"page":@1,@"scr":@""};
    [manager GET:url parameters:paramters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
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
