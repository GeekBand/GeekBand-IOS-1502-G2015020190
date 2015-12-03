//
//  YTLoginViewController.h
//  蓦然
//
//  Created by yt on 15/11/26.
//  Copyright © 2015年 yt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YTLoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *login;
@property (weak, nonatomic) IBOutlet UIButton *regist;
- (IBAction)loginButtonClicked:(id)sender;

@end
