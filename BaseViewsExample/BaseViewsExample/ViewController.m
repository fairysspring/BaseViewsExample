//
//  ViewController.m
//  BaseViewsExample
//
//  Created by Fairy on 14-10-17.
//  Copyright (c) 2014年 fairy.song. All rights reserved.
//

#import "ViewController.h"
#import "UIViewAdditions.h"
#import "ImageTitleButton.h"
#import "AverageTestView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self test_AverageView];
//    return;
    [self test_UIButtonImage_Title];
    return;
    /*[self testButton_sizetofit];
    [self testLabel_sizetofit];
    [self testToolBar];*/
//    [self testTextAttribute];
//    [self test_timeDateFormate];
	// Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)test_AverageView
{
    AverageTestView *view = [[AverageTestView alloc] initWithFrame:CGRectMake(0, 100,self.view.width, 55)];
    [self.view addSubview:view];
    for (int i = 0; i < 4; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        [view addSubview:button];
        [button setTitle:[NSString stringWithFormat:@"%d", i] forState:UIControlStateNormal];
    }
    view.backgroundColor = [UIColor purpleColor];
    
    [view setNeedsLayout];
}

- (void)test_timeDateFormate
{
    
    int64_t start = [[NSDate date] timeIntervalSince1970];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 300, 30)];
    label.text = [self getTimeStringStartTime:start endTime:start];
    [self.view addSubview:label];
}
- (NSString *)getTimeStringStartTime:(int64_t)start endTime:(int64_t)end
{
    if (start == 0 || end == 0) {
        return @"";
    }
    
    NSDate *startDate = [NSDate dateWithTimeIntervalSince1970:start];
    NSDate *endDate = [NSDate dateWithTimeIntervalSince1970:end];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];

    [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    
    NSString *startString = [dateFormatter stringFromDate:startDate];
    [dateFormatter setDateFormat:@"HH:mm"];
    NSString *endString = [dateFormatter stringFromDate:endDate];
    
    NSString *timeString = [NSString stringWithFormat:@"%@-%@",startString, endString];
    return timeString;
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

- (void)testToolBar
{
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 40, self.view.width, 50)];
    [self.view addSubview:toolBar];
    toolBar.translucent = YES	;
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    button.backgroundColor = [UIColor redColor];
    button.layer.cornerRadius = 8;
    button.layer.masksToBounds = YES;
    
    [toolBar addSubview:button];
    
    UIToolbar *toolBarView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 300, 320, 30)];
    [toolBarView setBarStyle:UIBarStyleDefault];
    
    UIBarButtonItem *firstButton = [[UIBarButtonItem alloc] initWithTitle:@"First" style:UIBarButtonItemStyleBordered target:self action:nil];
    UIBarButtonItem *spaceButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *secondButton = [[UIBarButtonItem alloc] initWithTitle:@"Second" style: UIBarButtonItemStyleDone target:self action:@selector(dismissKeyboard:)];
    UIBarButtonItem *spaceButton2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *secondButton2 = [[UIBarButtonItem alloc] initWithTitle:@"Second" style: UIBarButtonItemStyleDone target:self action:@selector(dismissKeyboard:)];
    secondButton.tintColor = [UIColor clearColor];
    
    NSArray *buttonArray = [NSArray arrayWithObjects:firstButton, spaceButton, secondButton,spaceButton2, secondButton2, nil];
    [toolBarView setItems:buttonArray];
//    toolBarView.barTintColor = [UIColor redColor];
    [self.view addSubview:toolBarView];
    

    
    
    
    
    
    
   // UIBarButtonItem *item1 = []
}
-(void)testTextAttribute
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 400, 320, 40)];
    [self.view addSubview:label];
    NSString *string = @"10k-15k";
    NSString *infoString = [NSString stringWithFormat:@"%@ | %@ | %@", string,@"北京",@"接受应届毕业生"];
    label.attributedText = [self colorText:infoString forRange:[string rangeOfString:string]];

}

#define RGBCOLOR(r,g,b)     [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f]
#define RGBACOLOR(r,g,b,a)     [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
//#define BACKGROUNDCOLOUR            @"#edf3f3"//背景色值
#define MAIN_ACTIVE_COLOR           RGBCOLOR(30.0f,180.0f,199.0f)
#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

- (NSAttributedString *)colorText:(NSString *)text forRange:(NSRange)range
{
    if (text.length < range.length || text.length == 0) {
        return nil;
    }
    NSMutableAttributedString * fansAttributeStr = [[NSMutableAttributedString alloc] initWithString:text];
    [fansAttributeStr addAttribute:NSForegroundColorAttributeName value:HEXCOLOR(0xf69a2e) range:range];
    return fansAttributeStr;
}

- (void)dismissKeyboard:(id)send
{
    
}


- (void)test_UIButtonImage_Title
{
    UIButton *button = [[ImageTitleButton alloc] initWithFrame:CGRectMake(50, 50, 100, 76/2)];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [button setImage:[UIImage imageNamed:@"icon_1"] forState:UIControlStateNormal];
    [button setTitle:@"找找看看" forState:UIControlStateNormal];
    button.titleLabel.font =[ UIFont systemFontOfSize:12];
    button.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:button];
}



@end
