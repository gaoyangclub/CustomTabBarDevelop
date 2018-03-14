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
#import "AppDelegate.h"
#import "SortViewController.h"
#import "JKNavigationController.h"

@interface ViewController ()<GYTabBarDelegate>

@property(nonatomic,retain)UILabel* titleView;

@end

@implementation ViewController

-(UILabel *)titleView{
    if (!_titleView) {
        _titleView = [[UILabel alloc]init];
        _titleView.font = [UIFont systemFontOfSize:20];
        _titleView.text = @"选项卡页";
        [_titleView sizeToFit];
        
//        [UICreationUtils createNavigationTitleLabel:20 color:COLOR_NAVI_TITLE text:NAVIGATION_TITLE_TASK_HOME superView:_titleView];
    }
    return _titleView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.titleView = self.titleView;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithTitle:@"下一个"
                                              style:UIBarButtonItemStylePlain
                                              target:self
                                              action:@selector(openNextController:)];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
//    / 会设置所有子控制器navigationBar的颜色，并且决定下一个Push的控制器默认的jk_barBackgroundColor，全局效果
    self.navigationController.navigationBar.jk_barBackgroundColor = [UIColor orangeColor];
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    if (!self.hidesBottomBarWhenPushed) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
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
    
    NSLog(@"tabBarController:%@",self.tabBarController);
}

-(void)openNextController:(UIView*)sender{
    SortViewController* vc = [[SortViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:vc animated:YES];
    [[AppDelegate getCurrentNavigationController] pushViewController:vc animated:YES];
}

-(void)didSelectItem:(GYTabBarView *)tabBar tabData:(TabData *)tabData index:(NSInteger)index{
//    NSLog(@"选中条目selectedIndex:%li",(long)index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
