//
//  RequestServiceManager.h
//  Sex
//
//  Created by shendong on 16/10/14.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SingletonProtocol.h"
@class RACSignal;
@interface RequestServiceManager : NSObject<SingletonProtocol>

- (RACSignal *)networkChangeSignal;

@end
