//
//  FirstView.m
//  GuideDemo
//
//  Created by lishuai on 13-10-17.
//  Copyright (c) 2013年 lishuai. All rights reserved.
//

#import "FirstView.h"

#define kViewAnimationDuration 0.25f
#define kDelayTime 0.3f;

@interface FirstView()

@property (nonatomic,retain) UIImageView *loginImage;
@property (nonatomic,retain) UILabel *label1;
@property (nonatomic,retain) UILabel *label2;
@property (nonatomic,retain) UILabel *label3;
@property (nonatomic,retain) UILabel *label4;

@end

@implementation FirstView

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
    
    _loginImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login"]];
    _loginImage.frame = CGRectMake((self.frame.size.width - 50)/2, 0, 50, 7.5);
    [self addSubview:_loginImage];
    
    
    _label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 40, 40)];
    _label1.backgroundColor = [UIColor whiteColor];
    _label1.text = @"请";
    _label1.textAlignment = UITextAlignmentCenter;
    
    _label2 = [[UILabel alloc] initWithFrame:CGRectMake(40, 20, 40, 40)];
    _label2.backgroundColor = [UIColor redColor];
    _label2.text = @"你";
    _label2.textAlignment = UITextAlignmentCenter;
    
    _label3 = [[UILabel alloc] initWithFrame:CGRectMake(80, 20, 40, 40)];
    _label3.backgroundColor = [UIColor yellowColor];
    _label3.text = @"登";
    _label3.textAlignment = UITextAlignmentCenter;
    
    _label4 = [[UILabel alloc] initWithFrame:CGRectMake(120, 20, 40, 40)];
    _label4.backgroundColor = [UIColor blueColor];
    _label4.text = @"录";
    _label4.textAlignment = UITextAlignmentCenter;
    
    _label1.alpha = 0;
    _label2.alpha = 0;
    _label3.alpha = 0;
    _label4.alpha = 0;
    
    [self addSubview:_label1];
    [self addSubview:_label2];
    [self addSubview:_label3];
    [self addSubview:_label4];
    
    
}

- (void)show{
    [super show];
    CABasicAnimation *animation0 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation0.toValue = [NSNumber numberWithDouble:4];
    animation0.duration = kViewAnimationDuration;
    animation0.removedOnCompletion = NO;
    animation0.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation1.fromValue = [NSNumber numberWithFloat:0];
    animation1.toValue = [NSNumber numberWithFloat:1];
    animation1.removedOnCompletion = NO;
    animation1.fillMode = kCAFillModeForwards;
    animation1.duration = kViewAnimationDuration;
    animation1.beginTime =CACurrentMediaTime() + kDelayTime;
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation2.fromValue = [NSNumber numberWithFloat:0];
    animation2.toValue = [NSNumber numberWithFloat:1];
    animation2.removedOnCompletion = NO;
    animation2.fillMode = kCAFillModeForwards;
    animation2.duration = kViewAnimationDuration;
    animation2.beginTime = CACurrentMediaTime() + 0.25f + kDelayTime;
    
    CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation3.fromValue = [NSNumber numberWithFloat:0];
    animation3.toValue = [NSNumber numberWithFloat:1];
    animation3.removedOnCompletion = NO;
    animation3.fillMode = kCAFillModeForwards;
    animation3.duration = kViewAnimationDuration;
    animation3.beginTime =  CACurrentMediaTime() + 0.5f + kDelayTime;
    
    CABasicAnimation *animation4 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation4.fromValue = [NSNumber numberWithFloat:0];
    animation4.toValue = [NSNumber numberWithFloat:1];
    animation4.removedOnCompletion = NO;
    animation4.fillMode = kCAFillModeForwards;
    animation4.duration = kViewAnimationDuration;
    animation4.beginTime =  CACurrentMediaTime() + 0.75f + kDelayTime;
    
    [_loginImage.layer addAnimation:animation0 forKey:@"animateLabel0"];
    [_label1.layer addAnimation:animation1 forKey:@"animateLabel1"];
    [_label2.layer addAnimation:animation2 forKey:@"animateLabel2"];
    [_label3.layer addAnimation:animation3 forKey:@"animateLabel3"];
    [_label4.layer addAnimation:animation4 forKey:@"animateLabel4"];
    
}

- (void)hide{
    [super hide];
    
    CABasicAnimation *animation0 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation0.toValue = [NSNumber numberWithDouble:1];
    animation0.fromValue = [NSNumber numberWithDouble:4];
    animation0.removedOnCompletion = NO;
    animation0.fillMode = kCAFillModeForwards;
    animation0.duration = 0.25f;
    
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnim.toValue = [NSNumber numberWithDouble:0];
    scaleAnim.fromValue = [NSNumber numberWithDouble:1];
    scaleAnim.removedOnCompletion = NO;
    scaleAnim.fillMode = kCAFillModeForwards;
    scaleAnim.duration = 0.25f;
    
    CABasicAnimation *opacAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacAnim.fromValue = [NSNumber numberWithFloat:1];
    opacAnim.toValue = [NSNumber numberWithFloat:0];
    opacAnim.removedOnCompletion = NO;
    opacAnim.fillMode = kCAFillModeForwards;
    opacAnim.duration = 0.25f;
    
    [_loginImage.layer addAnimation:animation0 forKey:@"animateLabel0"];
    
    CAAnimationGroup *group1 = [CAAnimationGroup animation];
    group1.animations = [NSArray arrayWithObjects:scaleAnim, opacAnim, nil];
    [_label1.layer addAnimation:group1 forKey:@"animateLabel1"];
    [_label2.layer addAnimation:group1 forKey:@"animateLabel2"];
    [_label3.layer addAnimation:group1 forKey:@"animateLabel3"];
    [_label4.layer addAnimation:group1 forKey:@"animateLabel4"];
    
}

- (void)dealloc{
    self.loginImage = nil;
    self.label1 = nil;
    self.label2 = nil;
    self.label3 = nil;
    self.label4 = nil;
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
