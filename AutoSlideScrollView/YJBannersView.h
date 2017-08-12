//
//  YJBannersView.h
//  PagedScrollViewDemo
//
//  Created by mervin on 2017/8/12.
//  Copyright © 2017年 浅浅浅. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YJBannersView : UIView

@property (nonatomic, strong) NSMutableArray *bannerList;

@property (nonatomic, copy) void (^tapActionBlock)(id tapedBanner);

- (void)reloadData;

@end


@interface BannerModel : NSObject

@property (strong, nonatomic) NSString *title, *image, *link, *name;

@end
