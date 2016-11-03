//
//  SexChannel.h
//  Sex
//
//  Created by Shendong on 16/9/28.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SexProduct : NSObject
@property (nonatomic, assign) NSUInteger action;
@property (nonatomic, assign) NSUInteger value;
@property (nonatomic, strong) NSURL *goodsImg;
@property (nonatomic, strong) NSString *goodsName;
@end

@interface SexChannel : NSObject
@property (nonatomic, strong) NSURL *navigationImage;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSURL *navigationName;
@property (nonatomic, strong) NSURL *classImg;
@property (nonatomic, copy) NSString *className;
@property (nonatomic, assign) NSUInteger action;
@property (nonatomic, assign) NSUInteger classId;
@property (nonatomic, assign) NSUInteger classSeq;
@property (nonatomic, assign) NSUInteger value;
@property (nonatomic, strong) NSArray *data;
@end
