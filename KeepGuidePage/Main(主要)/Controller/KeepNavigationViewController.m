//
//  KeepNavigationViewController.m
//  KeepGuidePage
//
//  Created by Michael on 16/7/22.
//  Copyright © 2016年 com.51fanxing.KeepGuidePage. All rights reserved.
//

#import "KeepNavigationViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "Constant.h"

@interface KeepNavigationViewController ()

@end

@implementation KeepNavigationViewController

+ (void)initialize
{
//    // 设置整个项目barButtonItem中的主题样式
//    UIBarButtonItem *barButtonItem = [UIBarButtonItem appearance];
//    // 设置普通状态
//    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
//    textAttrs[NSForegroundColorAttributeName] = FXRGBColor(7, 170, 153);
//    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
//    [barButtonItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
//    
//    // 设置不可用状态
//    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
//    selectedTextAttrs[NSForegroundColorAttributeName] = FXRGBColor(7, 170, 153);
//    
//    selectedTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
//    [barButtonItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    // 设置UINavigationBar的背景色
    [[UINavigationBar appearance] setBarTintColor:KeepNavigationThemeColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:17]}];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count >= 1) {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:@"back" target:self action:@selector(back)];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

@end
