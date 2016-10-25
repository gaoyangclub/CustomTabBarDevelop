//
//  ViewController.m
//  CustomTabViewController
//
//  Created by admin on 16/10/24.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ViewController.h"
#import "GYTabBarView.h"
#import "DIYTabBarItem.h"

@interface ViewController ()<GYTabBarDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"主页";
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController.navigationBar setTranslucent:NO];
    
    GYTabBarView* tabbar = [[GYTabBarView alloc] initWithFrame:CGRectMake(10, 0, 200, 30)];
    tabbar.itemClass = [DIYTabBarItem class];
    tabbar.dataArray = @[[TabData initWithParams:[DIYBarData initWithParams:@"数据A" image:@"图片1"] controller:nil],
                         [TabData initWithParams:[DIYBarData initWithParams:@"数据B" image:@"图片2"] controller:nil],
                         [TabData initWithParams:[DIYBarData initWithParams:@"数据C" image:@"图片3"] controller:nil]
                         ];
    tabbar.backgroundColor = [UIColor blueColor];
    tabbar.delegate = self;
    [self.view addSubview:tabbar];
    
    //\U00003439 \U000035ad \U000035ae \U000035af \U000035eb \U000035ec \U00003605"
}

-(void)didSelectItem:(GYTabBarView *)tabBar tabData:(TabData *)tabData index:(NSInteger)index{
    NSLog(@"选中条目selectedIndex:%li",(long)index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
