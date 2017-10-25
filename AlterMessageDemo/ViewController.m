//
//  ViewController.m
//  AlterMessageDemo
//
//  Created by dev on 2017/4/20.
//  Copyright © 2017年 nys. All rights reserved.
//

#import "ViewController.h"
#import "FDAlertView.h"
#import "CustomMessageView.h"

#define SCREENWIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREENHEIGHT ([[UIScreen mainScreen] bounds].size.height)


@interface ViewController ()<sendTheValueDelegate>
{
    CustomMessageView * contentView;
    FDAlertView *alert;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow1:) name:UIKeyboardWillShowNotification object:nil];
    // 监听键盘即将消失的事件. UIKeyboardWillHideNotification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHidden2:) name:UIKeyboardWillHideNotification object:nil];

    
    
    UIButton * btn=[UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.frame=CGRectMake(100, 100, 100, 100);
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    
    
}


-(void)btnClick
{
    alert = [[FDAlertView alloc] init];
    
    contentView=[[CustomMessageView alloc]initWithFrame:CGRectMake(0, 0, 290, 170)];
    contentView.delegate=self;
    //contentView.frame = CGRectMake(0, 0, 320, 160);
    alert.contentView = contentView;
    alert.backgroundColor = [UIColor redColor];
    alert.contentView.backgroundColor = [UIColor yellowColor];
    [alert show];
    
    
    contentView.contentLab.text=@"本次交易需要短信确认，验证码已经发送至您的手机13046631167。";
    
    
}


-(void)getTimeToValue:(NSString *)theTimeStr
{
    
    NSLog(@"文本框里的值是：%@",theTimeStr);
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    if (alert)
    {
         [alert hide];
    }
   
}


- (void) keyboardWillShow1:(NSNotification *)notify {
    
    CGFloat kbHeight = [[notify.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    
    
    NSLog(@"键盘出来了");
    
    [UIView animateWithDuration:0.3 animations:^{
        
        alert.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-kbHeight);
        alert.contentView.center=alert.center;
        
    }];
    
    
    
}


- (void) keyboardWillHidden2:(NSNotification *)notify {
    
    
    
    NSLog(@"键盘下去了");
    
    [UIView animateWithDuration:0.3 animations:^{
        
        alert.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);
         alert.contentView.center=alert.center;
        
    }];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
