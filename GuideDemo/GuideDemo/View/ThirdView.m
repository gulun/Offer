//
//  ThirdView.m
//  GuideDemo
//
//  Created by lishuai on 13-10-17.
//  Copyright (c) 2013年 lishuai. All rights reserved.
//

#import "ThirdView.h"
#define kViewAnimationDuration 0.25f

@implementation ThirdView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setUpViews];
    }
    return self;
}

- (void)setUpViews{
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    imageView2.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height -40);
    [self addSubview:imageView2];
    
    [imageView2 release];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 40, self.frame.size.width, 40);
    [button setTitle:@"进入主页" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor whiteColor];
    
    self.enterButton = button;
    
}

- (void)show{
    [super show];
    [UIView animateWithDuration:kViewAnimationDuration animations:^{
        self.transform = CGAffineTransformMakeScale(2.5, 2.5);
    }];
}

- (void)hide{
    [super hide];
    [UIView animateWithDuration:kViewAnimationDuration animations:^{
        self.transform = CGAffineTransformIdentity;
    }];
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
