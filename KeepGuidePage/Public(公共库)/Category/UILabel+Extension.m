//
//  UILabel+Extension.m
//  MYAlertView
//
//  Created by Michael on 2017/2/14.
//  Copyright © 2017年 com.chinabidding. All rights reserved.
//

#import "UILabel+Extension.h"
#import "UIView+Extension.h"

@implementation UILabel (Extension)

- (void)sizeToFitWidth:(float)width {
    self.numberOfLines = 0;
    self.lineBreakMode = NSLineBreakByCharWrapping;
    self.size = [self sizeThatFits:CGSizeMake(width, 0)];
}


@end
