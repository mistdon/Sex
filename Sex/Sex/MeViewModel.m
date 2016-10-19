//
//  MeViewModel.m
//  Sex
//
//  Created by Shendong on 16/10/15.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "MeViewModel.h"

@implementation MeViewModel

- (RACSignal *)fetchLatestUserInfo{
    //取最新，如果没有，取本地
    return [[SexUser shareInstance] fetchLatestInfos];
}


@end
