//
//  LoginViewController.m
//  Sex
//
//  Created by shendong on 16/9/29.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "LoginViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

#import "FastLoginViewModel.h"
#import "WXApi.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *fastLogInButton;
@property (weak, nonatomic) IBOutlet UITextField *fastPhoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *fastCodeTextField;
@property (weak, nonatomic) IBOutlet UIButton *fastQueryCodeButton;

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *forgetPasswordButton;
@property (weak, nonatomic) IBOutlet UIButton *logInButton;

@property (nonatomic, strong) FastLoginViewModel *fastlogInViewModel;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self bindWithFastLoginViewModel];
    [self bindWithPasswordLogInViewModel];
}
- (void)bindWithFastLoginViewModel{
    self.fastlogInViewModel = [[FastLoginViewModel alloc] init];
    RAC(self.fastlogInViewModel, phone_fast) = self.fastPhoneTextField.rac_textSignal;
    RAC(self.fastlogInViewModel, code)  = self.fastCodeTextField.rac_textSignal;
    RAC(self.fastlogInViewModel, phone_password) = self.phoneTextField.rac_textSignal;
    RAC(self.fastlogInViewModel, password) = self.passwordTextField.rac_textSignal;
    self.fastQueryCodeButton.rac_command =  self.fastlogInViewModel.queryCodeCommand;
    self.fastLogInButton.rac_command = self.fastlogInViewModel.logInWithCodeCommand;
    self.logInButton.rac_command = self.fastlogInViewModel.logInWithPasswordCommand;
    [[self.fastQueryCodeButton.rac_command.executionSignals switchToLatest] subscribeNext:^(id x) {
        NSLog(@"x = %@",x);
    }];
    [self.fastQueryCodeButton.rac_command.errors subscribeNext:^(id x) {
        NSLog(@"error = %@",x);
    }];
    
    [[self.fastLogInButton.rac_command.executionSignals switchToLatest] subscribeNext:^(id x) {
        NSLog(@"fast = %@",x);
    }];
    [self.fastLogInButton.rac_command.errors subscribeNext:^(id x) {
        NSLog(@"fast.err = %@",x);
    }];
    [[self.logInButton.rac_command.executionSignals switchToLatest] subscribeNext:^(id x) {
        NSLog(@"l : %@",x);
    }];
    [self.logInButton.rac_command.errors subscribeNext:^(id x) {
        NSLog(@" l = %@",x);
    }];
    
}
- (void)bindWithPasswordLogInViewModel{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)resignResponer:(id)sender {
     [self.view endEditing:YES];
}
- (IBAction)LoginWithWeChat:(id)sender {
    /*
     此处仅实现了发送信息到微信，微信登录需申请开通微信登录权限，费用300元
     note:
     1. 应首先判断用户是否安装了微信，如果没有安装，不要显示微信登录的按钮，微博登录同理
     2. 微信登录成功后，在onResq的回调中获取用户的信息，为用户新建账户，完成登录。如果没有登录功能，则显示scope参数错误
     !!!  所有功能仅作为研究学习之用，不可用作商业用途
     */
    if ([WXApi isWXAppInstalled]) {
        //此处实现发送信息到微信朋友的功能
        SendMessageToWXReq *req  = [[SendMessageToWXReq alloc] init];
        req.text = @"这是来自凤凰鸟的信息，不要回答，不要回答，不要回答";
        req.bText = YES;
        req.scene = WXSceneSession;
        [WXApi sendReq:req];
        // 微信登录功能
//         SendAuthReq *req = [[SendAuthReq alloc] init];
//         req.scope = @"snsapi_userinfo";
//         req.state = @"App";
//         [WXApi sendReq:req];
//         */
    }else{
        NSLog(@"未安装");
    }
}
- (IBAction)loginWithWeibo:(id)sender {
    //与微信登录同理
    NSLog(@"微博登录,未实现");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
