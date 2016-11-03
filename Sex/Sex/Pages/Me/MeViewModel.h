//
//  MeViewModel.h
//  Sex
//
//  Created by Shendong on 16/10/15.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SexUser.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface MeViewModel : NSObject

- (RACSignal *)fetchLatestUserInfo;

@end
