//
//  ViewController.m
//  JPLabel
//
//  Created by lava on 16/9/2.
//  Copyright © 2016年 lavaMusic. All rights reserved.
//

#import "ViewController.h"
#import "JPWebViewController.h"
#import "JPLabel.h"

@interface ViewController ()<JPLabelDelegate>

@property (weak, nonatomic) IBOutlet JPLabel *textLabel;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.textLabel.text = @"#JPLabel# 用于匹配字符串的内容显示, 用户:@伊人, 包括话题:#怎么追漂亮女孩?#, 链接:https://github.com/biyuhuaping/JPLabel.git, 协议:《使用协议》, 还有自定义要高亮显示的字符串.2020.12.12日又添加了下划线的功能";

    // 点选高亮文字颜色
    self.textLabel.jp_textHightLightBackgroundColor = [UIColor colorWithRed:237.0/255 green:213.0/255 blue:177.0/255 alpha:1];
    
    // 匹配文字颜色
    [self.textLabel setHightLightTextColor:[UIColor purpleColor] forHandleStyle:HandleStyleUser];
    [self.textLabel setHightLightTextColor:[UIColor blueColor] forHandleStyle:HandleStyleLink];
    [self.textLabel setHightLightTextColor:[UIColor orangeColor] forHandleStyle:HandleStyleTopic];
    [self.textLabel setHightLightTextColor:[UIColor colorWithRed:255.0/255 green:69.0/255 blue:0.0/255 alpha:1] forHandleStyle:HandleStyleAgreement];
    
    // 自定义匹配的文字和颜色#8FDF5C
    self.textLabel.jp_matchArr = @[
                                   @{
                                       JPString : @"高亮显示",
                                       JPColor : [UIColor redColor],
                                       JPFont : [UIFont systemFontOfSize:10],
                                       JPLine1 : @(NSUnderlineStyleSingle)
                                       },
                                   @{
                                       JPString : @"字符串.",
                                       JPColor : [UIColor greenColor],
                                       JPLine2 : @(NSUnderlineStyleSingle)
                                       }
                                   ];
    
    // 匹配到合适内容的回调
    self.textLabel.jp_tapBlock = ^(UILabel *label, HandleStyle style, NSString *selectedString, NSRange range){
        // 你想要做的事
        NSLog(@"block打印 %@", selectedString);
        if (style == HandleStyleLink) {
            JPWebViewController *web = [JPWebViewController new];
            web.URLString = selectedString;
            [self.navigationController pushViewController:web animated:YES];
        }
    };
    self.textLabel.delegate = self;
}

#pragma mark --------------------------------------------------
#pragma mark JPLabelDelegate

- (void)jp_label:(JPLabel *)label didSelectedString:(NSString *)selectedStr forStyle:(HandleStyle)style inRange:(NSRange)range{
    
    // 你想要做的事
    NSLog(@"代理打印 %@", selectedStr);
}

@end
