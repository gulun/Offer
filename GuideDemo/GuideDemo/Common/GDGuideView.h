//
//  GDGuideView.h
//  GuideDemo
//
//  Created by lishuai on 13-10-17.
//  Copyright (c) 2013年 lishuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GDGuideViewDelegate;

@interface GDGuideView : UIView


@property (nonatomic,assign) BOOL isBig;                        //view是否被放大,即：是否属于show的状态
@property (nonatomic,retain) UIButton *enterButton;             //进入主页按钮
@property (nonatomic,assign) id<GDGuideViewDelegate> delegate;  

- (void)show;                                                   //动画效果：放大view
- (void)hide;                                                   //动画效果：缩小view

@end


@protocol GDGuideViewDelegate <NSObject>

- (void)guideViewEnterMainVC;                                   //进入主页按钮的action

@end