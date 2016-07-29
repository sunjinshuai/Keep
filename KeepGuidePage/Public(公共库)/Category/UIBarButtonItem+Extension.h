//
//  UIBarButtonItem+Extension.h
//  LdleFishGuidePage
//
//  Created by Michael on 16/7/26.
//  Copyright © 2016年 com.51fanxing.searchController. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (nullable UIBarButtonItem *)barButtonItemWithImage:(nullable NSString *)imageName highlightImage:(nullable NSString *)highlightImageName target:(nullable id)target action:(nullable SEL)action;

+ (nullable UIBarButtonItem *)barButtonItemWithImage:(nullable NSString *)imageName target:(nullable id)target action:(nullable SEL)action;

@end
