//
//  ViewController.m
//  Sex
//
//  Created by Shendong on 16/9/28.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "ViewController.h"
//#import "SSKeychain.h"
//#import <SAMKeychain/SAMKeychain.h>

static NSString *const KSexServiceName = @"SexServiceUserinfo";
static NSString *const KAccount = @"15026570263";
static NSString *const KPassword = @"123456789";


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [SAMKeychain deletePasswordForService:@"Shendong" account:@"Shendong"];
////    [SAMKeychain setPassword:KPassword forService:KSexServiceName account:KAccount];
////    [SAMKeychain deletePasswordForService:@"Shendong" account:@"Shendong"];
//    NSLog(@"all.counts = %@", [SAMKeychain allAccounts]);
//    NSLog(@"password = %@",[SAMKeychain passwordForService:KSexServiceName account:KAccount]);
//    NSLog(@"ps = %@", [SSKeychain passwordForService:KSexServiceName account:KAccount]);
//    NSLog(@"count = %@",[SAMKeychain accountsForService:KSexServiceName]);
    

    
    
}
- (void)didReceiveMemoryWarning{
    NSLog(@"%s",__FUNCTION__);
}



@end
