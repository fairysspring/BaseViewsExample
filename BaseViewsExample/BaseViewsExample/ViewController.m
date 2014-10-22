//
//  ViewController.m
//  BaseViewsExample
//
//  Created by Fairy on 14-10-17.
//  Copyright (c) 2014年 fairy.song. All rights reserved.
//

#import "ViewController.h"
#import "UIViewAdditions.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self testButton_sizetofit];
    [self testLabel_sizetofit];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)testLabel_sizetofit
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.font = [UIFont systemFontOfSize:12];
    label.text = @"ç√√√√NSLineBreakByCharWrappingNSLineBreakByCharWrapping";
    
    label.top = 100;
    label.width = 100;//设置宽度，来使sizetofit 控制在此宽度，两行内 或者 不设置宽度，使其展示在一行内。
    label.numberOfLines = 2;
    label.lineBreakMode = NSLineBreakByCharWrapping;
    [label sizeToFit];
    label.backgroundColor = [UIColor blueColor];
    [self.view addSubview:label];
}

- (void)testButton_sizetofit
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont systemFontOfSize:12.0f	];
    button.top = 200;
    button.backgroundColor = [UIColor blackColor];
    [button setTitle:@"点击我试试" forState:UIControlStateNormal];
    
    //设置button的各个边距
    button.contentEdgeInsets = UIEdgeInsetsMake(30, 30, 30, 30);
    [button sizeToFit];
    [self.view addSubview:button];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
