//
//  CustomSegment.h
//  LojiDriver
//
//  Created by wanshaofa on 15/1/29.
//  Copyright (c) 2015年 何琴琴. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SegmentItem.h"

@interface CustomSegment : UIControl

@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, strong) NSArray *items;

-(id)initWithFrame:(CGRect)frame items:(NSArray *)items;

@end
