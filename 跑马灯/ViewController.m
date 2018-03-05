//
//  ViewController.m
//  跑马灯
//
//  Created by 杨晓周 on 2018/2/9.
//  Copyright © 2018年 杨晓周. All rights reserved.
//

#import "ViewController.h"
#import "YXZLoopView.h"

@interface ViewController ()
{
    YXZLoopView *_loopView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YXZLoopView *loopView = [[YXZLoopView alloc] initWithFrame:CGRectMake(0, 100, 375, 50)];
    loopView.backgroundColor = [UIColor redColor];
    [self.view addSubview:loopView];
    NSArray *array = @[@"1111111",@"222222222",@"3333333",@"44444444"];
    [loopView configureString:array];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
