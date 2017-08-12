//
//  ViewController.m
//  PagedScrollViewDemo
//
//  Created by mervin on 2017/8/12.
//  Copyright © 2017年 浅浅浅. All rights reserved.
//

#import "ViewController.h"
#import "YJBannersView.h"

@interface ViewController ()

@property (nonatomic, strong) YJBannersView *bannerView;

@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    YJBannersView *bannerView = [[YJBannersView alloc] init];
    bannerView.tapActionBlock = ^(id tapedBanner) {
        NSLog(@"%@", tapedBanner);
    };
    [self.view addSubview:bannerView];
    _bannerView = bannerView;
    [self reload];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(reload)];
    [self.view addGestureRecognizer:tap];
    
}

- (void) reload {
    if (_datas.count > 10) {
        [_datas removeAllObjects];
    }
    if (!_datas) {
        _datas = @[].mutableCopy;
    }
    [_datas addObjectsFromArray:@[@"people-2563491_960_720.jpg",
                       @"photographer-2550378_960_720.jpg",
                        @"wolf-in-sheeps-clothing-2577813_960_720.jpg"]];
    
    [self.bannerView setBannerList:_datas];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
