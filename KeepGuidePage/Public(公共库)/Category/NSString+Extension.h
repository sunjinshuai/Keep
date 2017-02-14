//
//  NSString+Extension.h
//  KeepGuidePage
//
//  Created by Michael on 2017/2/14.
//  Copyright © 2017年 com.51fanxing.KeepGuidePage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Extension)

- (CGSize)mySizeWithFont:(UIFont *)font maxSize:(CGSize)size lineBreakMode:(NSLineBreakMode)mode;
- (CGSize)mySizeWithFont:(UIFont *)font;
- (CGSize)mySizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
- (CGSize)mySizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;

@end
