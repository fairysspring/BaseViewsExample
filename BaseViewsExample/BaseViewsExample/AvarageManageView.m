//
//  AvarageManageView.m
//  BaseViewsExample
//
//  Created by Fairy on 14-10-26.
//  Copyright (c) 2014年 fairy.song. All rights reserved.
//

#import "AvarageManageView.h"
#import "UIViewAdditions.h"

#define kMargin_Left_Base 10
@implementation AvarageManageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    if (count == 0) {
        return;
    }
    
    //只有一个SubView
    if (count == 1) {
        UIView *subView = [self.subviews objectAtIndex:0];
        subView.centerX = self.width/2.0;
        subView.centerY = self.height/2.0;
        return;
    }
    
    //多个
    CGFloat subviewsWidth = 0;
    for (UIView *subView in self.subviews)
    {
        if ([subView isKindOfClass:[UIButton class]]) {
            subviewsWidth += subView.width;
        }
        
    }
    
    //保证子View的总宽度，可以平均分配
    if (subviewsWidth > self.width - kMargin_Left_Base*2) {
        return;
    }
    
    CGFloat  gap = (self.width - kMargin_Left_Base*2)*1.0/(count-1);
    UIView *preView = nil;
    for (UIView *subView in self.subviews)
    {
        if ([subView isKindOfClass:[UIButton class]]) {
            if (!preView) {
                subView.left = kMargin_Left_Base;
            }else{
                subView.left = preView.right + gap;
            }
            
            subView.centerY = self.height/2.0;
            preView = subView;
        }
        
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
