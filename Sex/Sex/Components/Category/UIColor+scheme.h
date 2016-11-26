//
//  UIColor+scheme.h
//  Sex
//
//  Created by Shendong on 2016/11/7.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBa(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface UIColor (scheme)

+ (UIColor *)mainColor;

@end
