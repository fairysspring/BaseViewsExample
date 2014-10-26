//
//  ImageTitleButton.m
//  BaseViewsExample
//
//  Created by Fairy on 14-10-26.
//  Copyright (c) 2014年 fairy.song. All rights reserved.
//

#import "ImageTitleButton.h"
#define kTitleHeight 12




@implementation ImageTitleButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGRect rc = contentRect;
    CGFloat h = (contentRect.size.height - kTitleHeight);
    rc.origin.y += h ;
    rc.size.height -= h;
    return rc;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    UIImage* img = [self imageForState:UIControlStateNormal];
    CGFloat w = img.size.width;
    CGFloat h = img.size.height;
    CGFloat x = (contentRect.size.width - w) / 2.0f;
    CGFloat y = 0;
    CGRect rc = CGRectMake(x, y	, w, h);
    
    return rc;
}

@end
