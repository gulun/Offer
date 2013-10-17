//
//  GuideImageView.m
//  GuideDemo
//
//  Created by lishuai on 13-10-17.
//  Copyright (c) 2013年 lishuai. All rights reserved.
//

#import "GuideImageView.h"

@interface GuideImageView()
@property (nonatomic,retain) UILabel *label;
@end

@implementation GuideImageView

- (id)initWithFrame:(CGRect)frame withImage:(NSString*)imageName
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView1.frame = frame;
        [self addSubview:imageView1];
        [imageView1 release];
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(140, 100, 80, 40)];
        _label.backgroundColor = [UIColor yellowColor];
        _label.text = @"我是动画";
        [self addSubview:_label];
    }
    return self;
}

- (void)show{
    [super show];
    [UIView animateWithDuration:1 animations:^{_label.frame = CGRectMake(140, 300, 80, 40);}];
}

- (void)hide{
    [super hide];
    [UIView animateWithDuration:0.25 animations:^{_label.frame = CGRectMake(140, 100, 80, 40);}];

}

- (void)dealloc{
    self.label = nil;
    [super dealloc];
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
