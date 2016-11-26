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

#import "SexConst.h"
#import "UIColor+scheme.h"

static NSString *kTitle = @"类别";
static NSInteger KFont = 13;

@interface DropdownView() <MKDropdownMenuDelegate, MKDropdownMenuDataSource>

@property (weak, nonatomic) IBOutlet MKDropdownMenu *dropdownMenu;
@property (nonatomic, assign) NSInteger selectRow;
@property (nonatomic, strong) DropdownViewModel *viewModel;

@end
@implementation DropdownView

- (void)bindWithViewModel{
    self.viewModel = [[DropdownViewModel alloc]  init];
    self.dropdownMenu.delegate = self;
    self.dropdownMenu.dataSource = self;
    self.dropdownMenu.useFullScreenWidth = YES;
    self.dropdownMenu.disclosureIndicatorImage = [UIImage imageNamed:@"indicator"];
    [RACObserve(self, currentChannel) subscribeNext:^(SexChannel *item) {
        [self.datas enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj && [obj isEqual:item]) {
                self.selectRow = idx;
                *stop = YES;
            };
        }];
        [self refresh];
    }];
    [RACObserve(self, datas) subscribeNext:^(id x) {
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
    return [[NSAttributedString alloc] initWithString:[self.datas objectAtIndex:row].name attributes:@{NSForegroundColorAttributeName:RGB(128, 128, 128), NSFontAttributeName:[UIFont systemFontOfSize:KFont]}];
}
- (BOOL)dropdownMenu:(MKDropdownMenu *)dropdownMenu shouldUseFullRowWidthForComponent:(NSInteger)component{
    return YES;
}
- (CGFloat)dropdownMenu:(MKDropdownMenu *)dropdownMenu rowHeightForComponent:(NSInteger)component{
    return 30;
}
- (void)dropdownMenu:(MKDropdownMenu *)dropdownMenu didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.currentChannel = self.datas[row];
    [dropdownMenu closeAllComponentsAnimated:YES];
}
- (UIView *)dropdownMenu:(MKDropdownMenu *)dropdownMenu viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel *label = [[UILabel alloc] init];
    NSString *name = self.datas[row].name;
    label.attributedText = [[NSAttributedString alloc] initWithString:[@"     " stringByAppendingString:name] attributes:@{NSForegroundColorAttributeName:self.selectRow == row?[UIColor mainColor] : RGB(128, 128, 128), NSFontAttributeName:[UIFont systemFontOfSize:KFont]}];
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
    NSAttributedString *attribute = [[NSAttributedString alloc] initWithString:kTitle attributes:@{NSForegroundColorAttributeName:RGB(128, 128, 128), NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    return attribute;
}
- (NSAttributedString *)dropdownMenu:(MKDropdownMenu *)dropdownMenu attributedTitleForSelectedComponent:(NSInteger)component{
    return [[NSAttributedString alloc] initWithString:kTitle attributes:@{NSForegroundColorAttributeName:[UIColor mainColor], NSFontAttributeName:[UIFont systemFontOfSize:KFont]}];
}
@end
