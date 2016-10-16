//
//  CartPorduct.h
//  Sex
//
//  Created by shendong on 16/10/10.
//  Copyright © 2016年 Shendong. All rights reserved.
//


/*
 nfo": [{
 "gid": "3984",
 "cid": "151",
 "pid": 150,
 "brid": "183",
 "issale": "0",
 "price": "294.00",
 "isterm": "0",
 "activity": 0,
 "favouable": {
 "9": {
 "acid": "1172",
 "name": "\u91d1\u79cb\u5927\u4fc3.\u5168\u573a\u6ee1109\u5373\u9001\u4ef7\u503c29\u5143NPG\u6da6\u6ed1\u6db2120ml",
 "stime": "1476331200",
 "etime": "1476979140",
 "gifttype": "0",
 "acrange": "0",
 "rangeext": "",
 "minmoney": "109.00",
 "maxmoney": "0.00",
 "actype": "0",
 "typeext": "0.00",
 "gift": "a:1:{i:0;a:3:{s:2:\"id\";s:4:\"1295\";s:4:\"name\";s:49:\"\u5c0f\u6cfd\u4eba\u4f53\u6da6\u6ed1\u6db2120ml \u539f\u88c5\u8fdb\u53e3 \u65e5\u672cNPG\";s:5:\"price\";s:1:\"0\";}}",
 "sort": "50",
 "url": ""
 }
 },
 "gsn": "810005",
 "gname": "\u5361\u7279\u7433\u5a1c2\u4ee3\u5347\u7ea7\u65cb\u8f6c\u4f38\u7f29",
 "mprice": "369.00",
 "inventory": "0",
 "thumb": null,
 "app_thumb": "",
 "goods_subtotal": 294,
 "url": "http:\/\/www.qinglvmao.com\/goods\/3984.html",
 "number": "1",
 "app_price": "294.00",
 "enable_app_price": "1",
 "isalways": "2",
 "caid": "1498012",
 "img": "http:\/\/image.chunshuitang.com\/goods\/810005.jpg",
 "isgift": "0",
 "optid": "1333",
 "color": "\u9999\u69df\u8272",
 "size": "",
 "artid": "0",
 "cuid": "0",
 "daily_id": 0,
 "stat": "1"
 
 
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CartPorduct : NSObject
@property (nonatomic, assign) BOOL selected;
@property (nonatomic, assign) CGFloat price;
@property (nonatomic, assign) CGFloat saving;
@property (nonatomic, assign) NSInteger number;
@property (nonatomic, assign) BOOL issale;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSURL *img;
@property (nonatomic, copy) NSString *gname;
@property (nonatomic, copy) NSString *name;

@end
