//
//  MYGroupIssueLabelCell.m
//  KeepGuidePage
//
//  Created by Michael on 2017/2/14.
//  Copyright © 2017年 com.51fanxing.KeepGuidePage. All rights reserved.
//

#import "MYGroupIssueLabelCell.h"
#import "UIColor+Extension.h"

@interface MYGroupIssueLabelCell()

@end

@implementation MYGroupIssueLabelCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.layer.borderColor = [UIColor colorWithHexString:@"#e5e5e5"].CGColor;
    self.layer.borderWidth = 0.5f;
    self.detailLabel.frame = self.contentView.bounds;
    [self.contentView addSubview:self.detailLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.layer.cornerRadius = self.bounds.size.height / 2;
    self.clipsToBounds = YES;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.layer.borderColor = [UIColor colorWithHexString:@"#e5e5e5"].CGColor;
    self.detailLabel.textColor = [UIColor colorWithHexString:@"#333333"];
}

- (UILabel *)detailLabel
{
    if (_detailLabel == nil) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.font = [UIFont systemFontOfSize:13.f];
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        _detailLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        _detailLabel.text = @"标签";
    }
    return _detailLabel;
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    if (selected) {
        self.layer.borderColor = [UIColor colorWithHexString:@"#fa4b9b"].CGColor;
        self.detailLabel.textColor = [UIColor colorWithHexString:@"#fa4b9b"];
    } else {
        self.layer.borderColor = [UIColor colorWithHexString:@"#e5e5e5"].CGColor;
        self.detailLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    }
}

@end
