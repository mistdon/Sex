//
//  SearchViewController.m
//  Sex
//
//  Created by Shendong on 16/9/29.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "SearchViewController.h"
#import "DropdownView.h"
@interface SearchViewController ()<DropDownViewDelegate>
@property (weak, nonatomic) IBOutlet DropdownView *dropdownView;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Search";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - dropdownviewdelegate -
- (void)selectCategory:(NSString *)category{
    NSLog(@"category = %@",category);
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
