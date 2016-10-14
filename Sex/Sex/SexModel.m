//
//  SexModel.m
//  Sex
//
//  Created by shendong on 16/10/14.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "SexModel.h"

@implementation SexModel
+ (NSArray *)testModels:(NSInteger)count{
    NSMutableArray *array = [NSMutableArray array];
    for (int index = 0; index < count; index++) {
        SexModel *model = [[SexModel alloc] init];
        model.descriptionContent = @"微盘宝";
        model.price = 23.4;
        [array addObject:model];
    }
    return [array copy];
}
@end
