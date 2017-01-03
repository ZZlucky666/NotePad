//
//  ViewController.m
//  NotePad
//
//  Created by Jack Zeng on 16/12/27.
//  Copyright © 2016年 Jack Zeng. All rights reserved.
//

#import "ViewController.h"
#import "MainTableViewCell.h"
#import "AddViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) UIButton *addBtn;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.dataArray = [NSMutableArray arrayWithCapacity:0];
    self.mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.mainTableView];
    [self.dataArray addObjectsFromArray:[NSArray arrayWithObjects:@"hello",@"world",@"world",@"world",@"world",nil]];
    self.view.backgroundColor = UIColorFromRGB(0x08C2FA);
    self.mainTableView.backgroundColor = UIColorFromRGB(0x08C2FA);
    self.mainTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.addBtn];
}

- (UIButton *)addBtn {
    if (_addBtn == nil) {
        _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _addBtn.frame = CGRectMake((SCREEN_WIDTH - 56)/2, SCREEN_HEIGHT - 81, 56, 56);
        [_addBtn setImage:[UIImage imageNamed:@"addButton"] forState:UIControlStateNormal];
        [_addBtn addTarget:self action:@selector(didClickAddBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addBtn;
}


- (void)didClickAddBtn {
    AddViewController *addVC = [[AddViewController alloc]init];
    [self presentViewController:addVC animated:YES completion:nil];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1 + self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.dataArray.count) {
        static NSString *cellId = @"LastCell";
        UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
        cell.backgroundColor = COLLOR_ARRAY[indexPath.row % 26];
        return cell;
    } else {
        static NSString *cellID = @"cellID";
        MainTableViewCell *contentCell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (contentCell == nil) {
            NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"MainTableViewCell" owner:self options:nil];
            contentCell = (MainTableViewCell *)[nib objectAtIndex:0];
            contentCell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        contentCell.backgroundColor = COLLOR_ARRAY[indexPath.row % 26];
        return contentCell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.dataArray.count == 0) {
        return SCREEN_HEIGHT;
    } else {
        if (indexPath.row == self.dataArray.count) {
            return 53;
        } else {
            return self.dataArray.count > 4? (SCREEN_HEIGHT - 53)/4 : (SCREEN_HEIGHT - 53)/self.dataArray.count;
        }
    }
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
