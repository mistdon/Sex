//
//  SexConfiguration.m
//  Sex
//
//  Created by shendong on 16/11/2.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "SexConfiguration.h"
#import <AFNetworking/AFNetworking.h>


@implementation SexConfiguration

SingletonInstance(SexConfiguration)

+ (void)setDefaultConfiguration{
    [self configureNetwork];
}

+ (void)configureNetwork{
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"Unknown");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"NotReachable");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"ViaWiFi");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"WWAN");
                break;
            default:
                break;
        };
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

@end
