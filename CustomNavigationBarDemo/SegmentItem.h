//
//  SegmentItem.h
//  LojiDriver
//
//  Created by wanshaofa on 15/1/29.
//  Copyright (c) 2015年 何琴琴. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+String.h"
#import "UIViewExt.h"

@interface SegmentItem : UIControl
@property (nonatomic, strong) NSString *title;
//@property (nonatomic, assign) BOOL selected;
@property (nonatomic, strong) UIColor *selectColor;
@property (nonatomic, strong) UIColor *normalColor;

-(id)initWithFrame:(CGRect)frame title:(NSString *)title selectColor:(UIColor *)selectColor normalColor:(UIColor *)normalColor;

@end
