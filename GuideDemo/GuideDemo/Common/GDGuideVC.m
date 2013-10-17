//
//  GDGuideVC.m
//  GuideDemo
//
//  Created by lishuai on 13-10-17.
//  Copyright (c) 2013年 lishuai. All rights reserved.
//

#import "GDGuideVC.h"
#import "GDGuideView.h"

#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface GDGuideVC () <UIScrollViewDelegate,GDGuideViewDelegate>

@property (retain,nonatomic) UIScrollView *scrollView;

@end

@implementation GDGuideVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _scrollPagingEnabled = YES;             //默认支持翻页
        _slideDirectionType = horizontalType;   //默认水平方向滑动
        _changePoint = CGPointMake(0, 0);       //默认发生动画的基准点为原点（0，0），在支持翻页的情况下，不需要更改
        _scrollViewContentLength = 200.0f;      //默认设置
    }

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.navigationController setNavigationBarHidden:YES];
    [self.view insertSubview:_backgroudView atIndex:0];
        
    //初始化 scrollView
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = YES;
    _scrollView.scrollEnabled = YES;
    _scrollView.bounces = YES;
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.pagingEnabled = _scrollPagingEnabled;

    //初始化scrollView 的 contentSize
    switch (_slideDirectionType) {
        case horizontalType:
            if (_scrollPagingEnabled)
                _scrollView.contentSize = CGSizeMake([_guideViewArray count]*kScreenWidth, kScreenHeight) ;
            else
                _scrollView.contentSize = CGSizeMake(kScreenWidth + _scrollViewContentLength, kScreenHeight);
            break;
        case verticalType:
            if (_scrollPagingEnabled) 
                _scrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight*[_guideViewArray count]);
            else
                _scrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight + _scrollViewContentLength);
        default:
            break;
    }
    
    [self setUpGuideViews];
    
    [self.view addSubview:_scrollView];
}

- (void)setUpGuideViews{
 
    for (int i=0; i<_guideViewArray.count; i++) {
        UIView *view = [_guideViewArray objectAtIndex:i];
        
        //对于支持翻页的，每一个view可以设定默认的值
        if (_slideDirectionType == horizontalType && _scrollPagingEnabled) {
            view.frame = CGRectMake(i*kScreenWidth, 0, kScreenWidth, kScreenHeight);
        }else if(_slideDirectionType == verticalType && _scrollPagingEnabled){
            view.frame = CGRectMake(0, i*kScreenHeight, kScreenWidth, kScreenHeight);
        }
        [_scrollView addSubview: view];
    }
    
}

#pragma mark -  UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    for (int i = 0; i<_guideViewArray.count; i++) {
        GDGuideView *guideView = [_guideViewArray objectAtIndex:i];
        guideView.delegate = self;
        if ([self shouldShow:guideView withPoint:scrollView.contentOffset]) {
            [guideView show];
        }else if ([self shouldHide:guideView withPoint:scrollView.contentOffset ]){
            [guideView hide];
        }else{
            
        }
    }
    
}

//判断guideView是否应该放大（展示）
- (BOOL)shouldShow:(GDGuideView*)view withPoint:(CGPoint) point{
    BOOL isAbove;
    switch (_slideDirectionType) {
        case horizontalType:
            isAbove = (view.frame.origin.x -  _changePoint.x <= point.x);
            break;
        case verticalType:
            isAbove = (view.frame.origin.y -  _changePoint.y <= point.y);
            break;
        default:
            break;
    }
   
    BOOL shouldChange = isAbove && !view.isBig;
    return shouldChange;
}

//判断guideView是否应该缩小 （隐藏）
- (BOOL)shouldHide:(GDGuideView*)view withPoint:(CGPoint) point{
    BOOL isAbove;
    switch (_slideDirectionType) {
        case horizontalType:
            isAbove = (view.frame.origin.x -  _changePoint.x > point.x);
            break;
        case verticalType:
            isAbove = (view.frame.origin.y -  _changePoint.y > point.y);
            break;
        default:
            break;
    }
    BOOL shouldChange = isAbove && view.isBig;
    return shouldChange;
}

- (BOOL)abovePoint:(CGPoint) point withView:(UIView*) view{
    BOOL isAbove = (view.frame.origin.y -  _changePoint.y <= point.y);
    return isAbove;
}

- (void)guideViewEnterMainVC{
//    MXViewController *mxVX = [[MXViewController alloc] init];
//    [self.navigationController pushViewController:mxVX animated:NO];
}

- (void)viewDidUnload{
    [super viewDidUnload];
    self.scrollView = nil;
    self.guideViewArray = nil;
}
- (void)dealloc{
    self.scrollView = nil;
    self.guideViewArray = nil;
    [super dealloc];
}
@end
