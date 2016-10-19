//
//  SexModel.h
//  Sex
//
//  Created by shendong on 16/10/14.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*
 "gid": "2761",
 "thumb": "http:\/\/image.chunshuitang.com\/goods\/603013.jpg",
 "name": "\u675c\u857e\u65afplay\u4eba\u4f53\u6da6\u6ed1\u6db2 I\u578b\u5feb\u611f\u88c550ML",
 "likenum": "462",
 "price": "39.00",
 "righttip": "",
 "lefttip": "",
 "sales": 28421
 
 */


@interface SexModel : NSObject

@property (nonatomic, strong) NSURL *image;
@property (nonatomic, copy) NSString *descriptionContent;
@property (nonatomic, assign) CGFloat price;
@property (nonatomic, strong) NSURL *thumb;
@property (nonatomic, copy) NSString *name;



+ (NSArray *)testModels:(NSInteger)count;

@end
