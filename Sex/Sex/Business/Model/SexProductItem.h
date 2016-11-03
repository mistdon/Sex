//
//  SexProduct.h
//  Sex
//
//  Created by Shendong on 16/10/9.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SexProductItem : NSObject

@property (nonatomic, copy) NSString *gid;
@property (nonatomic, copy) NSString *gsn;
@property (nonatomic, copy) NSString *lefttip;
@property (nonatomic, copy) NSString *likenum;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *righttip;
@property (nonatomic, copy) NSString *sales;
@property (nonatomic, strong) NSURL *thumb;

@end
