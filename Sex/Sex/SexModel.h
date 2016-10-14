//
//  SexModel.h
//  Sex
//
//  Created by shendong on 16/10/14.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SexModel : NSObject

@property (nonatomic, strong) NSURL *image;
@property (nonatomic, copy) NSString *descriptionContent;
@property (nonatomic, assign) CGFloat price;

+ (NSArray *)testModels:(NSInteger)count;

@end
