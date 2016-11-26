//
//  HomeViewController.m
//  Sex
//
//  Created by Shendong on 16/9/28.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "HomeViewController.h"

#import "UIScrollView+MaskView.h"
#import "HomeListViewModel.h"
@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet HomeListsTableView *listsTableView;
@property (nonatomic, strong) HomeListViewModel *listViewModel;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.listViewModel = [[HomeListViewModel alloc] init];
    [self.listViewModel bindWithTableView:self.listsTableView];
    
    [self setupNavigationTitleView];
    
    // Do any additional setup after loading the view.
}
- (void)setupNavigationTitleView{
    UIImage *image = [UIImage imageNamed:@"First_home_logo"];
    UIImageView *imageview = [[UIImageView alloc] initWithImage:image];
    self.navigationItem.titleView = imageview;
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
