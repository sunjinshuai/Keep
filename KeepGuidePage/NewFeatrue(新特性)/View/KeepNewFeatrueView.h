//
//  KeepNewFeatrueView.h
//  KeepGuidePage
//
//  Created by Michael on 16/6/30.
//  Copyright © 2016年 com.51fanxing.KeepGuidePage. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KeepNewFeatrueView;

@protocol KeepNewFeatrueViewDelegate <NSObject>

// 登录
- (void)keepNewFeatrueView:(nullable KeepNewFeatrueView *)keepNewFeatrueView didLogin:(nullable UIButton *)loginButton;
// 注册
- (void)keepNewFeatrueView:(nullable KeepNewFeatrueView *)keepNewFeatrueView didRegister:(nullable UIButton *)registerButton;

@end

@interface KeepNewFeatrueView : UIView

@property (nonatomic, weak, nullable) id <KeepNewFeatrueViewDelegate> delegate;

@end
