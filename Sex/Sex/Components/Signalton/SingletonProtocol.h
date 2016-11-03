//
//  SingletonProtocol.h
//  Sex
//
//  Created by shendong on 16/10/10.
//  Copyright © 2016年 Shendong. All rights reserved.
//

/*
  单例，实现单例时仅需遵守 SingletonProtocol协议即可
      采用 +(instance)shareInstance;创建单例
 
 */



#import <Foundation/Foundation.h>

#define SingletonInstance(classname) \
+ (instancetype)shareInstance{ \
    static classname *instance; \
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{ \
        instance = [classname new]; \
    }); \
    return instance; \
} \

@protocol SingletonProtocol <NSObject>

@required;
+ (instancetype)shareInstance;

@end
