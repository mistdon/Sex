//
//  DropdownView.m
//  Sex
//
//  Created by shendong on 16/9/29.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "DropdownView.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <Masonry.h>
#import "DropdownViewModel.h"
#import <MKDropdownMenu/MKDropdownMenu.h>


@interface DropdownView() <MKDropdownMenuDelegate, MKDropdownMenuDataSource>

@property (weak, nonatomic) IBOutlet MKDropdownMenu *dropdownMenu;
@property (nonatomic, assign) NSInteger selectRow;
@property (nonatomic, strong) DropdownViewModel *viewModel;
@property (nonatomic, strong) NSMutableArray *datas;

@end
@implementation DropdownView

- (void)bindWithViewModel{
    self.viewModel = [[DropdownViewModel alloc]  init];
    self.dropdownMenu.delegate = self;
    self.dropdownMenu.dataSource = self;
    self.dropdownMenu.disclosureIndicatorImage = [UIImage imageNamed:@"indicator"];
    self.datas = [NSMutableArray arrayWithObjects:@"11",@"22",@"33",@"44",@"55",@"66",@"77",nil];
    [RACObserve(self, categoryItem) subscribeNext:^(NSString *item) {
        self.selectRow = [self.datas indexOfObject:self.categoryItem] < self.datas.count?[self.datas indexOfObject:self.categoryItem]: 0;
        [self refresh];
    }];
}
- (void)didMoveToSuperview{
    [self bindWithViewModel];
}
- (void)refresh{
    [self.dropdownMenu reloadAllComponents];
}
#pragma mark - MKDropdownMenuDelegate -
- (nullable NSAttributedString *)dropdownMenu:(MKDropdownMenu *)dropdownMenu attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [[NSAttributedString alloc] initWithString:[self.datas objectAtIndex:row] attributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor], NSFontAttributeName:[UIFont systemFontOfSize:15]}];
}
- (BOOL)dropdownMenu:(MKDropdownMenu *)dropdownMenu shouldUseFullRowWidthForComponent:(NSInteger)component{
    return YES;
}
- (CGFloat)dropdownMenu:(MKDropdownMenu *)dropdownMenu rowHeightForComponent:(NSInteger)component{
    return 30;
}
- (void)dropdownMenu:(MKDropdownMenu *)dropdownMenu didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.categoryItem = self.datas[row];
    [dropdownMenu closeAllComponentsAnimated:YES];
}
- (UIView *)dropdownMenu:(MKDropdownMenu *)dropdownMenu viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel *label = [[UILabel alloc] init];
    label.attributedText = [[NSAttributedString alloc] initWithString:[@"     " stringByAppendingString:[self.datas objectAtIndex:row]] attributes:@{NSForegroundColorAttributeName:self.selectRow == row?[UIColor redColor] : [UIColor greenColor], NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    return label;
}
#pragma mark - MKDropdownMenuDatasource -
- (NSInteger)numberOfComponentsInDropdownMenu:(MKDropdownMenu *)dropdownMenu{
    return 1;
}
- (NSInteger)dropdownMenu:(MKDropdownMenu *)dropdownMenu numberOfRowsInComponent:(NSInteger)component{
    return self.datas.count;
}
- (nullable NSAttributedString *)dropdownMenu:(MKDropdownMenu *)dropdownMenu attributedTitleForComponent:(NSInteger)component{
    NSAttributedString *attribute = [[NSAttributedString alloc] initWithString:@"类别" attributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor], NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    return attribute;
}
- (NSAttributedString *)dropdownMenu:(MKDropdownMenu *)dropdownMenu attributedTitleForSelectedComponent:(NSInteger)component{
    return [[NSAttributedString alloc] initWithString:@"类别" attributes:@{NSForegroundColorAttributeName:[UIColor redColor], NSFontAttributeName:[UIFont systemFontOfSize:15]}];
}
@end
