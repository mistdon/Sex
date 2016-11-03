//
//  CreateAddressViewController.h
//  Sex
//
//  Created by shendong on 16/10/13.
//  Copyright © 2016年 Shendong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PartsTransportProtocol.h"


@interface CreateAddressViewController : UIViewController

@property (nonatomic, weak) IBOutlet id<PartsTransportProtocol> delegate;

@end
