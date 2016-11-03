//
//  FastLoginViewModel.h
//  Sex
//
//  Created by shendong on 16/9/29.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface FastLoginViewModel : NSObject
@property (nonatomic, copy) NSString *phone_fast;
@property (nonatomic, copy) NSString *phone_password;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *password;

@property (nonatomic, strong) RACCommand *queryCodeCommand;
@property (nonatomic, strong) RACCommand *logInWithCodeCommand;
@property (nonatomic, strong) RACCommand *logInWithPasswordCommand;
@end
