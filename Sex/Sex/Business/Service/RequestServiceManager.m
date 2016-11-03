//
//  RequestServiceManager.m
//  Sex
//
//  Created by shendong on 16/10/14.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "RequestServiceManager.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFNetworkReachabilityManager.h>

@implementation RequestServiceManager

SingletonInstance(RequestServiceManager)

- (RACSignal *)networkChangeSignal{
    return RACObserve([AFNetworkReachabilityManager sharedManager], networkReachabilityStatus);
}

@end
