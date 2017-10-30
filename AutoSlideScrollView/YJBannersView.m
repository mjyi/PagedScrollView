//
//  YJBannersView.m
//  PagedScrollViewDemo
//
//  Created by mervin on 2017/8/12.
//  Copyright © 2017年 浅浅浅. All rights reserved.
//

#import "YJBannersView.h"
#import "AutoSlideScrollView.h"

#define YJ_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define YJ_PAGECONTROL_HEIGHT 32.0
@interface YJBannersView ()

@property (nonatomic, strong) AutoSlideScrollView *slideView;
@property (nonatomic, strong) UIPageControl *pageControl;

@property (assign, nonatomic) CGFloat ratio;
@property (nonatomic, strong) NSMutableArray *imageViewList;
@end


@implementation YJBannersView

- (instancetype)init {
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor whiteColor];
        _ratio = 0.4;
        self.frame = CGRectMake(0, 0, YJ_SCREEN_WIDTH , YJ_SCREEN_WIDTH * _ratio);
    }
    return self;
}

//- (instancetype)initWithFrame:(CGRect)frame {
//    
//}


- (CGFloat)height {
    return YJ_SCREEN_WIDTH * _ratio;
}

- (void)setBannerList:(NSMutableArray *)bannerList {
    _bannerList = bannerList;

    if (!_slideView) {
        _slideView = [[AutoSlideScrollView alloc] initWithFrame:CGRectMake(0, 0, YJ_SCREEN_WIDTH, [self height]) animationDuration:3.0];
        _slideView.layer.masksToBounds = YES;
        _slideView.scrollView.scrollsToTop = NO;
        __weak typeof(self) weakSelf = self;
        _slideView.totalPagesCount = ^NSInteger(){
            return weakSelf.bannerList.count;
        };
        
        _slideView.fetchContentViewAtIndex = ^UIView *(NSInteger pageIndex){
            if (weakSelf.bannerList.count > pageIndex) {
                UIImageView *imageView = [[UIImageView alloc] initWithFrame:weakSelf.bounds];
                imageView.image = [UIImage imageNamed:weakSelf.bannerList[pageIndex]];
                return imageView;
            }else{
                return [UIView new];
            }
        };
        
        _slideView.currentPageIndexChangeBlock = ^(NSInteger currentPageIndex){
            weakSelf.pageControl.currentPage = currentPageIndex;
        };
        _slideView.tapActionBlock = ^(NSInteger pageIndex){
            weakSelf.tapActionBlock(weakSelf.bannerList[pageIndex]);
        };
        
        [self addSubview:_slideView];
    }
    
    // 定义 PageControl
    if (!_pageControl) {
        _pageControl = ({
            CGFloat w = YJ_SCREEN_WIDTH;
            CGFloat h = YJ_PAGECONTROL_HEIGHT;
            CGFloat x = 0;
            CGFloat y = [self height] - h;
            UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(x, y, w, h)];
            pageControl.userInteractionEnabled = NO;
            pageControl.pageIndicatorTintColor = [UIColor blackColor];
            pageControl.numberOfPages = _bannerList.count;
            pageControl;
        });
        [self addSubview:_pageControl];
    }
    [self reloadData];
}
- (void)reloadData {
    if (_bannerList.count <= 0) {
        return;
    }
    
    NSInteger currentPageIndex = MIN(self.slideView.currentPageIndex, _bannerList.count - 1) ;
    
    _pageControl.numberOfPages = _bannerList.count;
    _pageControl.currentPage = currentPageIndex;
    
    [_slideView reloadData];
}


@end

@implementation BannerModel


@end
