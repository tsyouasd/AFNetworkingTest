//
//  FirstViewController.m
//  NetworkProject
//
//  Created by JordanCZ on 16/5/24.
//  Copyright © 2016年 JordanCZ. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
{
    UIView  *view1;
    UIView  *view2;
    BOOL    animation;
}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton  *btntest = [UIButton buttonWithType:UIButtonTypeCustom];
    btntest.frame = CGRectMake(0, 0, 100, 50);
    btntest.backgroundColor = [UIColor orangeColor];
    [btntest addTarget:self action:@selector(buttonTestActioin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btntest];
    
    view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    view1.backgroundColor = [UIColor  greenColor];
    [self.view addSubview:view1];
    
    view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 150, 100, 100)];
    view2.backgroundColor = [UIColor  grayColor];
    [self.view addSubview:view2];
}

- (void)buttonTestActioin{
    animation = !animation;
    if (animation) {
        [UIView animateWithDuration:0.3f animations:^{
            view1.frame = CGRectMake(0, 180, 100, 100);
            
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                view1.frame = CGRectMake(0, 250, 100, 100);
                view2.frame = CGRectMake(0, 200, 100, 100);
            } completion:^(BOOL finished) {
                
            }];
        }];
    }
    else{
        [UIView animateWithDuration:0.5f animations:^{
            view1.frame = CGRectMake(0, 150, 100, 100);
            view2.frame = CGRectMake(0, 120, 100, 100);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                view1.frame = CGRectMake(0, 100, 100, 100);
                view2.frame = CGRectMake(0, 150, 100, 100);
            } completion:^(BOOL finished) {
                
            }];
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
