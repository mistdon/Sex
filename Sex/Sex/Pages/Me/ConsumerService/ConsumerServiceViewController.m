//
//  ConsumerServiceViewController.m
//  Sex
//
//  Created by Shendong on 16/10/16.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "ConsumerServiceViewController.h"
#import "UIScrollView+SexRefresh.h"
#import <MJRefresh/MJRefresh.h>

@interface ConsumerServiceViewController ()
@property (nonatomic, strong) UITableView<SexRefreshProtocol> *service;
@end

@implementation ConsumerServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.service = [[UITableView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.service];
    
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // Set the ordinary state of animated images
    
    NSMutableArray *pullingImages = [NSMutableArray array];
    NSMutableArray *idleImages = [NSMutableArray array];
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (int index = 1; index < 30; index++) {
        if (index < 10) {
            [pullingImages addObject:[UIImage imageNamed:[NSString stringWithFormat:@"ic_ani_loaing_%d",index]]];
        }else if(index < 20){
            [idleImages addObject:[UIImage imageNamed:[NSString stringWithFormat:@"ic_ani_loaing_%d",index]]];
        }else{
            [refreshingImages addObject:[UIImage imageNamed:[NSString stringWithFormat:@"ic_ani_loaing_%d",index]]];
        }
        
    }
    
    [header setImages:idleImages forState:MJRefreshStateIdle];
    // Set the pulling state of animated images（Enter the status of refreshing as soon as loosen）
    [header setImages:pullingImages forState:MJRefreshStatePulling];
    // Set the refreshing state of animated images
    [header setImages:refreshingImages forState:MJRefreshStateRefreshing];
    header.lastUpdatedTimeLabel.hidden = YES;
    
    // Hide the status
    header.stateLabel.hidden = YES;
    // Set header
    self.service.mj_header = header;
}
- (void)loadNewData{
    NSLog(@"loadNewData");

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
