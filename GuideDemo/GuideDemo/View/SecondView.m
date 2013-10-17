//
//  SecondView.m
//  GuideDemo
//
//  Created by lishuai on 13-10-17.
//  Copyright (c) 2013年 lishuai. All rights reserved.
//

#import "SecondView.h"
#define kViewAnimationDuration 0.25f

@implementation SecondView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"slogan"]];
        imageView1.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self addSubview:imageView1];
        [imageView1 release];
    }
    return self;
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
