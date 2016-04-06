//
//  CustomSegment.m
//  LojiDriver
//
//  Created by wanshaofa on 15/1/29.
//  Copyright (c) 2015年 何琴琴. All rights reserved.
//

#import "CustomSegment.h"

#define kIndexBackgroundColor    ([UIColor colorWithString:@"#f14321"])

#define kIndexViewHeight        2       // 索引高度
#define kIndexViewWidth         36      // 索引宽度

@implementation CustomSegment{
    NSMutableArray *itemViews;
    UIView *indexView;
    UIView *line;
    
    UIScrollView *_scrollView;
    
    NSInteger _showCount;   //
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _showCount = 4;
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame items:(NSArray *)items{
    self = [self initWithFrame:frame];
    if (self) {
        _items = items;
        [self initViews];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self initViews];
}

-(void)initViews{
    itemViews = [NSMutableArray array];
    
    line = [[UIView alloc] initWithFrame:CGRectZero];
    line.backgroundColor = [UIColor colorWithString:@"#e6e6e6"];
    [self addSubview:line];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    [self addSubview:_scrollView];
    
    indexView = [[UIView alloc] initWithFrame:CGRectZero];
    indexView.backgroundColor = kIndexBackgroundColor;
    [_scrollView addSubview:indexView];
    
    [self initItems];
}

-(void)initItems{
    for (int i = 0; i < _items.count; i++) {
        NSString *title = _items[i];
        SegmentItem *itemView = [[SegmentItem alloc] initWithFrame:CGRectZero title:title selectColor:nil normalColor:nil];
        itemView.tag = i;
        [itemView addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
        
        itemView.normalColor = [UIColor colorWithString:@"#666666"];
        itemView.selectColor = [UIColor colorWithString:@"#f14321"];
        
        [itemViews addObject:itemView];
        [_scrollView addSubview:itemView];
    }
    
    CGFloat width = self.bounds.size.width/_showCount;
    _scrollView.contentSize = CGSizeMake(width*_items.count, self.height);
    
    // 初始化索引试图frame
    indexView.frame = CGRectMake((width-kIndexViewWidth)/2.0, self.height-kIndexViewHeight, kIndexViewWidth, kIndexViewHeight);
}

-(void)setItems:(NSArray *)items{
    _items = items;
    [self initItems];
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat width = self.bounds.size.width/_showCount;
    SegmentItem *selectedItem = nil;
    for (int i = 0; i < itemViews.count; i++) {
        SegmentItem *itemView = itemViews[i];
        if (i == _currentIndex) {
            itemView.selected = YES;
            selectedItem = itemView;
        } else {
            itemView.selected = NO;
        }
        itemView.frame = CGRectMake(i*width, 0, width, self.height);
    }
    
    [UIView animateWithDuration:.35 animations:^{
        indexView.frame = CGRectMake( 0, self.height-kIndexViewHeight, kIndexViewWidth, kIndexViewHeight);
        
        indexView.center = selectedItem.center;
        indexView.bottom = self.height;
    }];
    
    line.frame = CGRectMake(0, self.height- 0.5, self.width, 0.5);
}

-(void)itemAction:(SegmentItem *)item{
    self.currentIndex = item.tag;
    
    for (int i = 0; i < itemViews.count; i++) {
        SegmentItem *itemView = itemViews[i];
        itemView.selected = NO;
    }
    
    item.selected = YES;
    [self setNeedsLayout];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

-(void)setCurrentIndex:(NSInteger)currentIndex{
    _currentIndex = currentIndex;
    
    CGFloat width = self.bounds.size.width/_showCount;
    
    CGPoint contentOffset = CGPointMake(width * currentIndex, 0);
    
    if (contentOffset.x + _scrollView.width - width >= _scrollView.contentSize.width) {
        contentOffset = CGPointMake(width * (_items.count-_showCount), 0);
        [_scrollView setContentOffset:contentOffset animated:YES];
        return;
    }
    
    [_scrollView setContentOffset:contentOffset animated:YES];
    
}

@end
