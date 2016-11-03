//
//  FastLoginViewModel.m
//  Sex
//
//  Created by shendong on 16/9/29.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "FastLoginViewModel.h"
@interface FastLoginViewModel()
@property (nonatomic, strong) RACSignal *validPhoneWithCodeSignal;
@property (nonatomic, strong) RACSignal *validCodeSignal;
@property (nonatomic, strong) RACSignal *validPhoneWithPasswordSignal;
@property (nonatomic, strong) RACSignal *validPasswordSignal;
@end
@implementation FastLoginViewModel

- (instancetype)init{
    if (self = [super init]) {
        [self initialize];
    }
    return self;
}

- (void)initialize{
}
#pragma mark - ObserveSignal
- (RACSignal *)validPhoneWithCodeSignal{
    if (!_validPhoneWithCodeSignal) {
        _validPhoneWithCodeSignal = [RACObserve(self, phone_fast).distinctUntilChanged map:^id(NSString *value) {
            return @(value.length == 11);  //默认为中国内地11位手机号码
        }];
    }
    return _validPhoneWithCodeSignal;
}
- (RACSignal *)validCodeSignal{
    if (!_validCodeSignal) {
        _validCodeSignal = [RACObserve(self, code).distinctUntilChanged map:^id(NSString *value) {
            return @(value.length == 5); // 密码默认为5位数字
        }];
    }
    return _validCodeSignal;
}
- (RACSignal *)validPhoneWithPasswordSignal{
    if (!_validPhoneWithPasswordSignal) {
        _validPhoneWithPasswordSignal = [RACObserve(self, phone_password).distinctUntilChanged map:^id(NSString *value) {
            return @(value.length == 11);
        }];
    }
    return _validPhoneWithPasswordSignal;
}
- (RACSignal *)validPasswordSignal{
    if (!_validPasswordSignal) {
        _validPasswordSignal = [RACObserve(self, password).distinctUntilChanged map:^id(NSString *value) {
            return @(value.length > 0);
        }];
    }
    return _validPasswordSignal;
}
#pragma mark - command -
- (RACCommand *)queryCodeCommand{
    if (!_queryCodeCommand) {
        _queryCodeCommand = [[RACCommand alloc] initWithEnabled:self.validPhoneWithCodeSignal signalBlock:^RACSignal *(id input) {
            return [self queryCodeSignal];
        }];
    }
    return _queryCodeCommand;
}
- (RACCommand *)logInWithCodeCommand{
    if (!_logInWithCodeCommand) {
        RACSignal *combine = [RACSignal combineLatest:@[self.validPhoneWithCodeSignal, self.validCodeSignal] reduce:^id(NSNumber *phone, NSNumber *code){
            return @([phone boolValue] && [code boolValue]);
        }];
        _logInWithCodeCommand = [[RACCommand alloc] initWithEnabled:combine signalBlock:^RACSignal *(id input) {
            return [self fastLogInSignal];
        }];
    }
    return _logInWithCodeCommand;
}
- (RACCommand *)logInWithPasswordCommand{
    if (!_logInWithPasswordCommand) {
        RACSignal *combine = [RACSignal combineLatest:@[self.validPhoneWithPasswordSignal, self.validPasswordSignal] reduce:^id(NSNumber *phone, NSNumber *password){
            return @(phone.boolValue && password.boolValue);
        }];
        _logInWithPasswordCommand = [[RACCommand alloc] initWithEnabled:combine signalBlock:^RACSignal *(id input) {
            return [self loginWithPasswordSignal];
        }];
    }
    return _logInWithPasswordCommand;
}
#pragma mark - querydata signal -
- (RACSignal *)fastLogInSignal{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"Success"];
        [subscriber sendCompleted];
        return nil;
    }];
}
- (RACSignal *)queryCodeSignal{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"query success"];
        [subscriber sendCompleted];
        return nil;
    }];
}
- (RACSignal *)loginWithPasswordSignal{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"login password"];
        [subscriber sendCompleted];
        return nil;
    }];
}
@end
