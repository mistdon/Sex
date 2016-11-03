//
//  TableViewCell.m
//  Sex
//
//  Created by shendong on 16/9/29.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

+ (NSString *)cellIdentifier{
    return [NSStringFromClass([self class]) stringByAppendingString:@"Identifier"];
}

@end
