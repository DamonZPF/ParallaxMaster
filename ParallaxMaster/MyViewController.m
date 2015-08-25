//
//  MyViewController.m
//  ParallaxMaster
//
//  Created by Duomai on 15/8/13.
//  Copyright (c) 2015年 zpf. All rights reserved.
//

#import "MyViewController.h"
#import "UIImage+ImageWithColor.h"
#import "ParallaxView.h"
@interface MyViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)NSMutableArray * contentsData;
@property(nonatomic,weak)UILabel * titleNameLabel;
@property(nonatomic,assign) CGFloat alphaVar;
@end

@implementation MyViewController

-(NSMutableArray*)contentsData{

    if (_contentsData == nil) {
        _contentsData = [NSMutableArray array];
    }
    return _contentsData;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithWhite:1 alpha:self.alphaVar]] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
   self.titleNameLabel.alpha = self.alphaVar;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.parallaxView.parallaxScrollView.delegate = self;
    self.tableView.tableHeaderView = self.parallaxView;
   
    
    UILabel * titleLable = [[UILabel alloc] init];
    titleLable.frame = CGRectMake(0, 0, 100, 21);
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.text = @"Parallax";
    self.navigationItem.titleView = titleLable;
    self.titleNameLabel = titleLable;
    
   self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    
    for (NSInteger index = 0; index < 100; index++) {
        [self.contentsData addObject:[NSString stringWithFormat:@"Row %ld",(long)index]];
    }
    
}

#pragma mark ScrollView delegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.parallaxView layoutParallaxViewByOffset:scrollView.contentOffset];
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat alpha = offsetY / 300;
    if (alpha >=1) {
        alpha = 0.99;
    }
    self.alphaVar = alpha;
    self.titleNameLabel.alpha = alpha;
    [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithWhite:1 alpha:alpha]] forBarMetrics:UIBarMetricsDefault];

    
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.contentsData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    
    cell.textLabel.text = self.contentsData[indexPath.row];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
      UIViewController * vc = [[UIViewController alloc] init];
    vc.navigationItem.title = @"asfdasdfads";
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc
                                         animated:YES];
    [self.navigationController.navigationBar  setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithWhite:1 alpha:1]] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage imageWithColor:[UIColor lightGrayColor] width:0.5];

}

@end
