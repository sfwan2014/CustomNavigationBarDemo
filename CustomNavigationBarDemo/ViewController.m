//
//  ViewController.m
//  CustomNavigationBarDemo
//
//  Created by sfwan on 16/4/6.
//  Copyright © 2016年 sfwan. All rights reserved.
//

#import "ViewController.h"
#import "CustomSegment.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithString:@"#f1f1f1"];
    
    CGRect bounds = [UIScreen mainScreen].bounds;
    NSArray *items = @[@"标题0",@"标题1",@"标题2",@"标题3",@"标题4",@"标题5",@"标题6",@"标题7",@"标题8",@"标题9",@"标题10"];
    CustomSegment *segment = [[CustomSegment alloc] initWithFrame:CGRectMake(0, 20, bounds.size.width, 44) items:items];
    segment.backgroundColor = [UIColor whiteColor];
    
    [segment addTarget:self action:@selector(test:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:segment];
}

-(void)test:(CustomSegment *)sg{
    NSLog(@"%d", sg.currentIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
