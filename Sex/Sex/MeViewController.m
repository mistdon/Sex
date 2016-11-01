//
//  MeViewController.m
//  Sex
//
//  Created by Shendong on 16/9/28.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "MeViewController.h"
#import "MeViewModel.h"
#import "SexUser.h"
#import <SDWebImage/UIButton+WebCache.h>

@interface MeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *UserDefaultImageView;
@property (strong, nonatomic) IBOutlet MeViewModel *meViewModel;
@property (weak, nonatomic) IBOutlet UIButton *userinfoButton;
@property (weak, nonatomic) IBOutlet UIButton *jifenButton;
@property (weak, nonatomic) IBOutlet UIButton *youhuiquanButton;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new];
    self.UserDefaultImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"userDefaultBgImg%d",rand()%3]];
    [[self.meViewModel fetchLatestUserInfo] subscribeNext:^(SexUser *x) {
        [self.userinfoButton sd_setImageWithURL:x.thumb forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"headImg_default_nor"]];
        [self.userinfoButton setTitle:x.name forState:UIControlStateNormal];
        [self.jifenButton setTitle:[NSString stringWithFormat:@"积分 %ld",x.jifenNum] forState:UIControlStateNormal];
        [self.youhuiquanButton setTitle:[NSString stringWithFormat:@"优惠券 %ld",x.youhuiquanNum] forState:UIControlStateNormal];
    }];
//    self.hidesBottomBarWhenPushed = YES;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.navigationController pushViewController:[UIViewController new] animated:YES];
//    });
    
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
