//
//  SexShareSerivce.m
//  Sex
//
//  Created by shendong on 16/10/12.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "SexShareSerivce.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
//#import <AFNetworking.h>
#import <AFNetworking.h>


//static NSString *weChatBase

NSString *const WeChatAppId = @"wx6eb6a2804be15bb3";
static NSString *const WeChatAppSecret = @"1307578fef94c28928a53126e4f2af17";
@implementation SexShareSerivce

SingletonInstance(SexShareSerivce)

- (RACSignal *)fetchAccess_tokenWithCode:(NSString *)code{
    RACReplaySubject *replay = [RACReplaySubject subject];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",nil];
    NSString *url = [NSString stringWithFormat:@"https://api.weixin.qq.com/sns/oauth2/access_token?appid=%@&secret=%40125@&code=%@&grant_type=authorization_code",WeChatAppId, WeChatAppSecret,code];
//    [manager GET:url parameters:nil progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        [replay sendNext:responseObject];
//        [replay sendCompleted];
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        [replay sendError:error];
//    }];
    [manager GET:url parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        [replay sendNext:responseObject];
        [replay sendCompleted];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [replay sendError:error];
    }];
     return replay;
}
@end
