//
//  SexShareSerivce.h
//  Sex
//
//  Created by shendong on 16/10/12.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SingletonProtocol.h"
@class RACSignal;
FOUNDATION_EXPORT  NSString *const  WeChatAppId;

@interface SexShareSerivce : NSObject<SingletonProtocol>
- (RACSignal *)fetchAccess_tokenWithCode:(NSString *)code;
@end
