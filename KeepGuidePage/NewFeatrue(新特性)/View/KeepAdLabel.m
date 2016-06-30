//
//  KeepAdLabel.m
//  KeepGuidePage
//
//  Created by Michael on 16/6/30.
//  Copyright © 2016年 com.51fanxing.KeepGuidePage. All rights reserved.
//

#import "KeepAdLabel.h"

@implementation KeepAdLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.font = [UIFont fontWithName:@"Helvetica" size:23.0];
        self.textAlignment = NSTextAlignmentCenter;
        self.textColor = [UIColor whiteColor];
    }
    return self;
}

@end
