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

-(void)openNextController:(UIView*)sender{
    
    
    SortViewController* vc = [[SortViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:vc animated:YES];
    [[AppDelegate getCurrentVC].navigationController pushViewController:vc animated:YES];
}

-(void)didSelectItem:(GYTabBarView *)tabBar tabData:(TabData *)tabData index:(NSInteger)index{
//    NSLog(@"选中条目selectedIndex:%li",(long)index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
