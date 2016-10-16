//
//  SexUser.m
//  Sex
//
//  Created by Shendong on 16/10/15.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "SexUser.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation SexUser

SingletonInstance(SexUser)

- (RACSignal *)fetchLatestInfos{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        //假设给出默认值
        SexUser *user = [SexUser shareInstance];
        user.name = @"大东哥";
        user.jifenNum = 344;
        user.youhuiquanNum = 5;
        [subscriber sendNext:user];
        [subscriber sendCompleted];
        return nil;
    }];
}

@end
