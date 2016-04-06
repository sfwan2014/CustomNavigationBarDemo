//
//  SegmentItem.m
//  LojiDriver
//
//  Created by wanshaofa on 15/1/29.
//  Copyright (c) 2015年 何琴琴. All rights reserved.
//

#import "SegmentItem.h"

#define main_color ([UIColor darkTextColor])


@implementation SegmentItem{
    UILabel *label;
}

-(id)initWithFrame:(CGRect)frame title:(NSString *)title selectColor:(UIColor *)selectColor normalColor:(UIColor *)normalColor{
    self = [super initWithFrame:frame];
    if (self) {
        _title = title;
        _selectColor = selectColor;
        _normalColor = normalColor;
        self.backgroundColor = [UIColor clearColor];
        
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14];
        label.backgroundColor = [UIColor clearColor];
        [self addSubview:label];
    }
    return self;
}

-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    if (_normalColor == nil) {
        _normalColor = [UIColor colorWithString:@"#666666"];
    }
    if (_selectColor == nil) {
        _selectColor = main_color;
    }
    
    label.text = _title;
    label.frame = self.bounds;
    if (self.selected) {
        label.textColor = _selectColor;
    } else {
        label.textColor = _normalColor;
    }
}

@end
