//
//  NSString+Extension.m
//  KeepGuidePage
//
//  Created by Michael on 2017/2/14.
//  Copyright © 2017年 com.51fanxing.KeepGuidePage. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (CGSize)mySizeWithFont:(UIFont *)font maxSize:(CGSize)size lineBreakMode:(NSLineBreakMode)mode
{
    CGSize realSize = CGSizeZero;
    CGRect textRect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    realSize = textRect.size;
    realSize.width = ceilf(realSize.width);
    realSize.height = ceilf(realSize.height);
    return realSize;
}

- (CGSize)mySizeWithFont:(UIFont *)font
{
    CGSize resultSize = [self mySizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, font.lineHeight)];
    
    return resultSize;
}

- (CGSize)mySizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size
{
    CGSize resultSize = [self mySizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    
    return resultSize;
}

- (CGSize)mySizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    CGSize resultSize = [self mySizeWithFont:font maxSize:size lineBreakMode:lineBreakMode];
    
    return resultSize;
}


@end
