//
//  UIView+SDExtension.m
//  SDBundleManager
//
//  Created by shendong on 16/11/1.
//  Copyright © 2016年 shendong. All rights reserved.
//

#import "UIView+SDExtension.h"

@implementation UIView (SDExtension)

- (void)setSd_x:(CGFloat)sd_x{
    CGRect frame = self.frame;
    frame.origin.x = sd_x;
    self.frame = frame;
}
- (CGFloat)sd_x{
    return self.sd_origin.x;
}
- (CGFloat)sd_y{
    return self.sd_origin.y;
}
- (void)setSd_y:(CGFloat)sd_y{
    CGRect frame = self.frame;
    frame.origin.y = sd_y;
    self.frame = frame;
}
- (void)setSd_size:(CGSize)sd_size{
    CGRect frame = self.frame;
    frame.size = sd_size;
    self.frame = frame;
}
- (CGSize)sd_size{
    return self.frame.size;
}
- (void)setSd_origin:(CGPoint)sd_origin{
    CGRect frame = self.frame;
    frame.origin = sd_origin;
    self.frame = frame;
}
- (CGPoint)sd_origin{
    return self.frame.origin;
}
- (void)setSd_centerX:(CGFloat)sd_centerX{
    CGPoint center = self.center;
    center.x = sd_centerX;
    self.center = center;
}
- (CGFloat)sd_centerX{
    return self.center.x;
}
- (void)setSd_centerY:(CGFloat)sd_centerY{
    CGPoint center = self.center;
    center.y  = sd_centerY;
    self.center = center;
}
- (CGFloat)sd_centerY{
    return self.center.y;
}
- (void)setSd_width:(CGFloat)sd_width{
    CGRect frame = self.frame;
    frame.size.width = sd_width;
    self.frame = frame;
}
- (CGFloat)sd_width{
    return self.frame.size.width;
}
- (void)setSd_heigth:(CGFloat)sd_heigth{
    CGRect frame = self.frame;
    frame.size.height = sd_heigth;
    self.frame = frame;
}
- (CGFloat)sd_heigth{
    return self.frame.size.height;
}
@end
