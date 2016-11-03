//
//  SexUser.h
//  Sex
//
//  Created by Shendong on 16/10/15.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SingletonProtocol.h"

@class RACSignal;
@interface SexUser : NSObject<SingletonProtocol>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger jifenNum;
@property (nonatomic, assign) NSInteger youhuiquanNum;
@property (nonatomic, strong) NSURL *thumb;

- (RACSignal *)fetchLatestInfos;


@end
