//
//  ListsHeaderCollectionReusableView.h
//  Sex
//
//  Created by Shendong on 16/9/28.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SexChannel;
@interface ListsHeaderCollectionReusableView : UICollectionReusableView

- (void)bindChannel:(SexChannel *)channel;
@end
