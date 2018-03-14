//
//  UserHomeController.m
//  CustomTabViewController
//
//  Created by admin on 2017/11/16.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "UserHomeController.h"
#import "ViewController.h"
#import "AppDelegate.h"

@interface UserHomeController ()

@property(nonatomic,retain)UIView* userBackView;

@end

@implementation UserHomeController

-(UIView *)userBackView{
    if (!_userBackView) {
        _userBackView = [[UIView alloc]init];
        _userBackView.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:_userBackView];
    }
    return _userBackView;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

//- (void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
////    if (!self->notHideNavigationBar) {
//        [self.navigationController setNavigationBarHidden:YES animated:NO];
////    }else{
////        self->notHideNavigationBar = NO;
////    }
//}

-(void)viewDidLayoutSubviews{
    self.userBackView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 5);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.navigationController.navigationBar.translucent = NO;
    self.userBackView.hidden = NO;
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"提   交" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(10, 200, self.view.bounds.size.width - 20, 50);
    [btn addTarget:self action:@selector(clickSubmitButton:) forControlEvents:UIControlEventTouchUpInside];
    
    if (!self.hidesBottomBarWhenPushed) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

-(void)clickSubmitButton:(UIView*)sender{
    ViewController* vc = [[ViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [[AppDelegate getCurrentNavigationController] pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
