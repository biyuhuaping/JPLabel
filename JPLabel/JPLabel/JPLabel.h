//
//  JPLabel.h
//  JPLabel
//
//  Created by lava on 16/9/2.
//  Copyright © 2016年 lavaMusic. All rights reserved.
//

#import <UIKit/UIKit.h>

//#define kJPString @"string"
//#define kJPColor @"color"


typedef NS_ENUM(NSUInteger, HandleStyle) {
    HandleStyleNone = 0,
    HandleStyleUser = 1,        //@用户
    HandleStyleTopic = 2,       //#话题#
    HandleStyleLink = 3,        //链接
    HandleStyleAgreement = 4,   //协议
    HandleStyleUserDefine = 5   //用户自定义
};

///关键字
static NSString *JPString = @"string";
///颜色
static NSString *JPColor = @"color";
///字体
static NSString *JPFont = @"font";
///删除线(中划线)
static NSString *JPLine1 = @"strikethrough";
///下划线
static NSString *JPLine2 = @"underline";


@class JPLabel;

@protocol JPLabelDelegate <NSObject>

@optional

- (void)jp_label:(JPLabel *)label didSelectedString:(NSString *)selectedStr forStyle:(HandleStyle)style inRange:(NSRange)range;

@end


typedef void(^JPBlock)(UILabel *, HandleStyle, NSString *, NSRange);


@interface JPLabel : UILabel



/// 选中时高亮背景色
@property (strong, nonatomic) UIColor *jp_textHightLightBackgroundColor;

/// 自定义要高亮匹配的 字符串+显示颜色 字典数组, 请把要匹配的文字用string这个key存入字典, 把要高亮的颜色用color这个key存入字典, 具体见demo
@property (copy, nonatomic) NSArray<NSDictionary *> *jp_matchArr;

/// 给不同种类的高亮文字设置颜色
- (void)setHightLightTextColor:(UIColor *)hightLightColor forHandleStyle:(HandleStyle)handleStyle;



/// 点击事件block回调
@property (strong, nonatomic) JPBlock jp_tapBlock;

/// delegate
@property (weak, nonatomic) id<JPLabelDelegate> delegate;

@end
