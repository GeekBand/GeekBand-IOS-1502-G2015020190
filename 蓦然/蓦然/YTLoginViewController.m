//
//  YTLoginViewController.m
//  蓦然
//
//  Created by yt on 15/11/26.
//  Copyright © 2015年 yt. All rights reserved.
//

#import "YTLoginViewController.h"

@interface YTLoginViewController ()

@end

@implementation YTLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)loginButtonClicked:(id)sender {
    NSString *userEmail = self.email.text;
    NSString *userPassword = self.password.text;
    //后续添加邮箱合法性，密码长度合法性的判断
    if (userEmail.length == 0) {
        NSLog(@"请输入邮箱");
    } else if (userPassword.length == 0) {
        NSLog(@"请输入密码");
    }
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
