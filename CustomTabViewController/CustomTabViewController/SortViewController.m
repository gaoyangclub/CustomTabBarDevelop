//
//  ViewController.m
//  JSDropDownMenuDemo
//
//  Created by Jsfu on 15-1-12.
//  Copyright (c) 2015年 jsfu. All rights reserved.
//

#import "SortViewController.h"
#import "JSDropDownMenu.h"
#import "ViewController.h"
#import "AppDelegate.h"
#import "JKNavigationController.h"

@interface SortViewController ()<JSDropDownMenuDataSource,JSDropDownMenuDelegate>{
    
    NSArray *_data1;
    NSArray *_data2;
    NSArray *_data3;
    
    NSInteger _currentData1Index;
    NSInteger _currentData2Index;
    NSInteger _currentData3Index;
    
//    NSInteger _currentData1SelectedIndex;
    JSDropDownMenu *menu;
}

@property(nonatomic,retain)UILabel* titleView;
@property(nonatomic,retain)UIView* userBackView;

@end

@implementation SortViewController

-(UILabel *)titleView{
    if (!_titleView) {
        _titleView = [[UILabel alloc]init];
        _titleView.font = [UIFont systemFontOfSize:20];
        _titleView.text = @"筛选页";
        [_titleView sizeToFit];
    }
    return _titleView;
}

-(UIView *)userBackView{
    if (!_userBackView) {
        _userBackView = [[UIView alloc]init];
        _userBackView.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:_userBackView];
    }
    return _userBackView;
}

-(void)viewDidLayoutSubviews{
    self.userBackView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 3);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    UIView* userBackView = [[UIView alloc]init];
//    userBackView.backgroundColor = [UIColor lightGrayColor];
//    [self.view addSubview:userBackView];
//    
//    userBackView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 10);
//    self.userBackView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 10);
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    self.automaticallyAdjustsScrollViewInsets = self.navigationController.navigationBar.translucent = NO;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    /// 修改navigationBar的tintColor需要重绘返回按钮JKBackIndicatorButton的背景图，所以封装起来了。
    /// 会设置所有子控制器navigationBar的颜色，并且决定下一个Push的控制器默认的jk_barBackgroundColor，全局效果
//    self.navigationController.navigationBar.jk_barBackgroundColor = [UIColor orangeColor];
    [self.navigationController.navigationBar jk_setNavigationBarBackgroundColor:[UIColor purpleColor]];//只设置背景不影响全局
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    // 指定默认选中
//    _currentData1Index = 0;
//    _currentData1SelectedIndex = 0;
    
//    NSArray *food = @[@"全部美食", @"火锅", @"川菜", @"西餐", @"自助餐"];
//    NSArray *travel = @[@"全部旅游", @"周边游", @"景点门票", @"国内游", @"境外游"];
    
//    _data1 = [NSMutableArray arrayWithObjects:@{@"title":@"美食", @"data":food}, @{@"title":@"旅游", @"data":travel}, nil];
    _data1 = @[@"不限金额",@"0~1000",@"1000~5000",@"5000~10000",@"10000以上"];
    _data2 = @[@"不限资质",@"信用卡",@"芝麻分",@"公积金"];//[NSMutableArray arrayWithObjects:@"智能排序", @"离我最近", @"评价最高", @"最新发布", @"人气最高", @"价格最低", @"价格最高", nil];
    _data3 = @[@"不限期限",@"1~30天",@"1月~6月",@"6月~12月",@"12月以上"];//[NSMutableArray arrayWithObjects:@"不限人数", @"单人餐", @"双人餐", @"3~4人餐", nil];
    
    menu = [[JSDropDownMenu alloc] initWithOrigin:CGPointMake(0, 20) andHeight:45];
    menu.indicatorColor = [UIColor colorWithRed:175.0f/255.0f green:175.0f/255.0f blue:175.0f/255.0f alpha:1.0];
    menu.separatorColor = [UIColor colorWithRed:210.0f/255.0f green:210.0f/255.0f blue:210.0f/255.0f alpha:1.0];
    menu.textColor = [UIColor colorWithRed:83.f/255.0f green:83.f/255.0f blue:83.f/255.0f alpha:1.0f];
    menu.dataSource = self;
    menu.delegate = self;
    
    [self.view addSubview:menu];
    
    
    self.navigationItem.titleView = self.titleView;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                              initWithTitle:@"下一个"
                                              style:UIBarButtonItemStylePlain
                                              target:self
                                              action:@selector(openNextController:)];
    
//    NSLog(@"tabBarController:%@",self.tabBarController);
//    NSArray* viewControllers = [AppDelegate getCurrentNavigationController].viewControllers;
//    if (viewControllers.firstObject == self) {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    }
    if (!self.hidesBottomBarWhenPushed) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}


-(void)openNextController:(UIView*)sender{
    ViewController* vc = [[ViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:vc animated:YES];
    [[AppDelegate getCurrentNavigationController] pushViewController:vc animated:YES];
}

- (NSInteger)numberOfColumnsInMenu:(JSDropDownMenu *)menu {
    
    return 3;
}

//-(BOOL)displayByCollectionViewInColumn:(NSInteger)column{
//    
////    if (column==2) {
////        
////        return YES;
////    }
//    
//    return NO;
//}

-(BOOL)haveRightTableViewInColumn:(NSInteger)column{
    
//    if (column==0) {
//        return YES;
//    }
    return NO;
}

-(CGFloat)widthRatioOfLeftColumn:(NSInteger)column{
//    
//    if (column==0) {
//        return 0.3;
//    }
    
    return 1;
}

-(NSInteger)currentLeftSelectedRow:(NSInteger)column{
    
    if (column==0) {
        
        return _currentData1Index;
        
    }
    else if (column==1) {
        
        return _currentData2Index;
    }
    else if (column==2) {
        
        return _currentData3Index;
    }
    
    return 0;
}

- (NSInteger)menu:(JSDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow{
    
    if (column==0) {
//        if (leftOrRight==0) {
        
            return _data1.count;
//        } else{
//            
//            NSDictionary *menuDic = [_data1 objectAtIndex:leftRow];
//            return [[menuDic objectForKey:@"data"] count];
//        }
    } else if (column==1){
        
        return _data2.count;
        
    } else if (column==2){
        
        return _data3.count;
    }
    
    return 0;
}

- (NSString *)menu:(JSDropDownMenu *)menu titleForColumn:(NSInteger)column{
    
    switch (column) {
        case 0: return _data1[_currentData1Index];//[[_data1[_currentData1Index] objectForKey:@"data"] objectAtIndex:_currentData1SelectedIndex];
            break;
        case 1: return _data2[_currentData2Index];
            break;
        case 2: return _data3[_currentData3Index];
            break;
        default:
            return nil;
            break;
    }
}

- (NSString *)menu:(JSDropDownMenu *)menu titleForRowAtIndexPath:(JSIndexPath *)indexPath {
    
    if (indexPath.column==0) {
//        if (indexPath.leftOrRight==0) {
//            NSDictionary *menuDic = [_data1 objectAtIndex:indexPath.row];
//            return [menuDic objectForKey:@"title"];
//        } else{
//            NSInteger leftRow = indexPath.leftRow;
//            NSDictionary *menuDic = [_data1 objectAtIndex:leftRow];
//            return [[menuDic objectForKey:@"data"] objectAtIndex:indexPath.row];
//        }
        return _data1[indexPath.row];
        
    } else if (indexPath.column==1) {
        
        return _data2[indexPath.row];
        
    } else {
        
        return _data3[indexPath.row];
    }
}

- (void)menu:(JSDropDownMenu *)menu didSelectRowAtIndexPath:(JSIndexPath *)indexPath {
    
    if (indexPath.column == 0) {
        
//        if(indexPath.leftOrRight==0){
//            
//            _currentData1Index = indexPath.row;
//            
//            return;
//        }
        
        _currentData1Index = indexPath.row;
        
    } else if(indexPath.column == 1){
        
        _currentData2Index = indexPath.row;
        
    } else{
        
        _currentData3Index = indexPath.row;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
