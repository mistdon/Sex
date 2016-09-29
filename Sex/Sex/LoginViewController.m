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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
