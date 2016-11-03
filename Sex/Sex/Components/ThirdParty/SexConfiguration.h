//
//  SexConfiguration.h
//  Sex
//
//  Created by shendong on 16/11/2.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SingletonProtocol.h"

@interface SexConfiguration : NSObject<SingletonProtocol>

+ (void)setDefaultConfiguration;

@end
