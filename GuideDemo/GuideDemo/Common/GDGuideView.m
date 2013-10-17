//
//  GDGuideView.m
//  GuideDemo
//
//  Created by lishuai on 13-10-17.
//  Copyright (c) 2013年 lishuai. All rights reserved.
//

#import "GDGuideView.h"

@implementation GDGuideView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _isBig = NO;//默认是view为隐藏状态
    }
    return self;
}

- (void)show{
    _isBig = YES;
}

- (void)hide{
    _isBig = NO;
}

- (void)setEnterButton:(UIButton *)enterButton{
    
    if (_enterButton != enterButton) {
        [_enterButton release];
        _enterButton = [enterButton retain];
        
        [self addSubview:enterButton];
        [enterButton addTarget:self action:@selector(goToMainVC) forControlEvents:UIControlEventTouchUpInside];
    }
  
}

- (void)goToMainVC{
    if (self.delegate && [self.delegate respondsToSelector:@selector(guideViewEnterMainVC)]) {
        [_delegate guideViewEnterMainVC];
    }
}

- (void)dealloc{
    self.enterButton = nil;
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
