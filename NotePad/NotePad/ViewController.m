//
//  ViewController.m
//  NotePad
//
//  Created by Jack Zeng on 16/12/27.
//  Copyright © 2016年 Jack Zeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) UIButton *addBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self.view addSubview:self.mainTableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
