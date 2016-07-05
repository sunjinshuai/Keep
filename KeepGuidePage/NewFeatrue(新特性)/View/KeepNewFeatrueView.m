//
//  KeepNewFeatrueView.m
//  KeepGuidePage
//
//  Created by Michael on 16/6/30.
//  Copyright © 2016年 com.51fanxing.KeepGuidePage. All rights reserved.
//

#import "KeepNewFeatrueView.h"
#import "KeepAdScrollView.h"

@interface KeepNewFeatrueView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) KeepAdScrollView *adScrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation KeepNewFeatrueView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
       
        [self addSubview:self.imageView];
        
        [self addSubview:self.registerButton];
        
        [self addSubview:self.loginButton];

        [self addSubview:self.adScrollView];
        
        self.adScrollView.titles = @[@"全程记录你的健身数据",@"规范你的训练过程",@"陪伴你迈出跑步的第一步",@"分享汗水后你的性感"];
   
        self.pageControl.numberOfPages = self.adScrollView.titles.count;
        
        self.timer = [NSTimer timerWithTimeInterval:3.0f target:self selector:@selector(timerChanged) userInfo:nil repeats:YES];
        
        [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
    return self;
}

- (void)timerChanged
{
    int page = (self.pageControl.currentPage + 1) % 4;
    self.pageControl.currentPage = page;
    CGFloat offsetX = (page + 1) * self.bounds.size.width;
    CGPoint offset = CGPointMake(offsetX, 0);
    
    [self.adScrollView setContentOffset:offset animated:YES];
}

#pragma mark - setter and getter
- (UIImageView *)imageView
{
    if (!_imageView) {
        UIImage *image = [UIImage imageNamed:@"keep"];
        _imageView = [[UIImageView alloc] initWithImage:image];
        CGFloat X = ([UIScreen mainScreen].bounds.size.width - image.size.width) * 0.5;
        CGFloat Y = [UIScreen mainScreen].bounds.size.height * 0.25;
        _imageView.frame = CGRectMake(X, Y, image.size.width, image.size.height);
        [self addSubview:_imageView];
    }
    return _imageView;
}

- (UIButton *)registerButton
{
    if (!_registerButton) {
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat margin = 20;
        CGFloat X = margin;
        CGFloat H = 50;
        CGFloat W = ([UIScreen mainScreen].bounds.size.width - 3 * margin) * 0.5;
        CGFloat Y = [UIScreen mainScreen].bounds.size.height - H - 15;
        _registerButton.frame = CGRectMake(X, Y, W, H);
        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
        [_registerButton setBackgroundColor:[UIColor blackColor]];
        _registerButton.titleLabel.font = [UIFont systemFontOfSize:18];
        
        _registerButton.layer.cornerRadius = 3.0f;
        _registerButton.alpha = 0.4f;
    }
    return _registerButton;
}

- (UIButton *)loginButton
{
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat margin = 20;
        CGFloat X = CGRectGetMaxX(self.registerButton.frame) + margin;
        CGFloat H = 50;
        CGFloat W = ([UIScreen mainScreen].bounds.size.width - 3 * margin) * 0.5;
        CGFloat Y = [UIScreen mainScreen].bounds.size.height - H - 15;
        _loginButton.frame = CGRectMake(X, Y, W, H);
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_loginButton setBackgroundColor:[UIColor whiteColor]];
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:18];
        _loginButton.layer.cornerRadius = 3.0f;
        _loginButton.alpha = 0.4f;
    }
    return _loginButton;
}

- (KeepAdScrollView *)adScrollView
{
    if (!_adScrollView) {
        _adScrollView = [[KeepAdScrollView alloc] init];
        _adScrollView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 105);
    }
    return _adScrollView;
}

- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        CGFloat W = self.adScrollView.titles.count * 5;
        _pageControl.frame = CGRectMake(0, CGRectGetMaxY(self.adScrollView.frame) + 10, W, 10);
        _pageControl.currentPage = 0;
        [self addSubview:_pageControl];
    }
    return _pageControl;
}

@end
