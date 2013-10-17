//
//  GDGuideVC.h
//  GuideDemo
//
//  Created by lishuai on 13-10-17.
//  Copyright (c) 2013年 lishuai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    horizontalType,//水平方向
    verticalType,//垂直方向拉动
}slideDirectionType;

@interface GDGuideVC : UIViewController

@property (nonatomic,retain) UIView *backgroudView;                     //  背景图片
@property (nonatomic,retain) NSMutableArray *guideViewArray;            //  新手引导里的guideView数组
@property (nonatomic,assign) slideDirectionType slideDirectionType;     //  滑动方向
@property (nonatomic,assign) BOOL scrollPagingEnabled;                  //  scrollView是否支持整页翻动

@property (nonatomic,assign) CGPoint changePoint;                       //  guideView发生动画效果的标准点，在支持翻页时，该点默认设为(0,0)
@property (nonatomic,assign) float scrollViewContentLength;             //  ScrollView content大小,在不支持整页翻动时使用

@end
