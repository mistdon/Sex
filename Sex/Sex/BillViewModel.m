//
//  BillViewModel.m
//  Sex
//
//  Created by shendong on 16/10/13.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "BillViewModel.h"
#import "PayTableViewCell.h"

static NSString *const KBillDetailIdentifier = @"billDetailIdentifier";
static NSString *const KPaywayIdentifier = @"paywayIdentifier";
static NSString *const KTransportIdentifier = @"transportIdentifier";
static NSString *const KProductCellIdentifier = @"productCellIdentifier";
static NSString *const KNoaddressIdentifer = @"noaddressIdentifer";
static NSString *const KAddressIdentifer = @"addressIdentifier";

@implementation BillViewModel
{
    NSArray *datas;
    
}
- (instancetype)init{
    if (self = [super init]) {
        datas = @[@[@YES],
                  @[@"one", @"two"],
                  @[@"wechat",@"alipay",@"jd"],
                  @[@"SF",@"yuantong"],
                  @[@"msg1",@"msg2",@"msg3"]];
    }
    return self;
}
- (void)closeBill:(NSArray *)bills{
    self.payway = @"wechat";
    self.transportway = @"SF";
    if (self.reloadBlock) {
       self.reloadBlock(-1); 
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KAddressIdentifer];
        return cell;
    }else if(indexPath.section == 1 || indexPath.section == 2){
        PayTableViewCell *paycell = [tableView dequeueReusableCellWithIdentifier:KPaywayIdentifier];
        paycell.selectedButton.selected = [[datas[indexPath.section] objectAtIndex:indexPath.row] isEqualToString:indexPath.section == 1 ? self.payway : self.transportway];
        paycell.selecteBlcok = ^(BOOL selected){
            if (indexPath.section == 1) {
                self.payway = [datas[indexPath.section] objectAtIndex:indexPath.row];
            }else{
                self.transportway = [datas[indexPath.section] objectAtIndex:indexPath.row];
            }
            if (self.reloadBlock) {
                self.reloadBlock(indexPath.section);
            }
        };
        return paycell;
    }else if(indexPath.section == 3){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KBillDetailIdentifier];
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KAddressIdentifer];
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return section == 0 ? 0 : 11;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [datas[section] count];
}
@end
