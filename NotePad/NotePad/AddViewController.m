//
//  AddViewController.m
//  NotePad
//
//  Created by Jack Zeng on 17/1/2.
//  Copyright © 2017年 Jack Zeng. All rights reserved.
//

#import "AddViewController.h"
#import "TargetEditView.h"

@interface AddViewController ()<TargetEditViewDelegate>

@property (strong, nonatomic) UIButton *cancelTargetBtn;
@property (strong, nonatomic) UIButton *addTargetBtn;
@property (nonatomic, strong) TargetEditView *editView;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0x08C2FA);
    [self setupUI];
}

- (void)setupUI {
    self.cancelTargetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cancelTargetBtn.frame = CGRectMake(20, 40, 30, 30);
    [self.cancelTargetBtn setImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
    [self.cancelTargetBtn addTarget:self action:@selector(didClickCancelBtn) forControlEvents:UIControlEventTouchUpInside];
    
    self.addTargetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.addTargetBtn.frame = CGRectMake(SCREEN_WIDTH - 50, 40, 30, 30);
    [self.addTargetBtn setImage:[UIImage imageNamed:@"done"] forState:UIControlStateNormal];
    [self.addTargetBtn addTarget:self action:@selector(didClickAddBtn) forControlEvents:UIControlEventTouchUpInside];
    
    self.editView = [[TargetEditView alloc]initWithtext:@"点击开始输入..." andMaxLength:300000];
    self.editView.backgroundColor = UIColorFromRGB(0x08C2FA);
    self.editView.frame = CGRectMake(20, 120, SCREEN_WIDTH, SCREEN_HEIGHT - 150);
    self.editView.font = [UIFont systemFontOfSize:20];
    self.editView.textColor = UIColorFromRGB(0xFFFFFF);
//    self.editView.textContainerInset = UIEdgeInsetsMake(10, 10, 30, 10);
    self.editView.textViewDelegate = self;
    
    [self.view addSubview:self.cancelTargetBtn];
    [self.view addSubview:self.addTargetBtn];
    [self.view addSubview:self.editView];
}

- (void)didClickCancelBtn {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didClickAddBtn {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TargetEditViewDelegate
- (void)textViewEndEditing:(TargetEditView *)targetEditView andCountRes:(NSInteger)res {
    
}
@end
