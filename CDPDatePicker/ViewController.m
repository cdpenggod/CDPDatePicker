//
//  ViewController.m
//  CDPDatePicker
//
//  Created by MAC on 15/3/30.
//  Copyright (c) 2015年 com.xuezi.CDP. All rights reserved.
//

#import "ViewController.h"
#import "CDPDatePicker.h"
@interface ViewController () <CDPDatePickerDelegate> {
    CDPDatePicker *_datePicker;
    UILabel *_label;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor greenColor];
    
    _label=[[UILabel alloc] initWithFrame:CGRectMake(30,50,260,40)];
    _label.backgroundColor=[UIColor cyanColor];
    [self.view addSubview:_label];
    
    UIButton *button=[[UIButton alloc] initWithFrame:CGRectMake(30,100,40,30)];
    button.backgroundColor=[UIColor redColor];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    _datePicker=[[CDPDatePicker alloc] initWithSelectTitle:nil viewOfDelegate:self.view delegate:self];
    
//    _datePicker.isBeforeTime=NO;(是否可选择以前时间)
    
//    _datePicker.theTypeOfDatePicker=1;(datePicker显示类别，只写了三种主流)
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_datePicker popDatePicker];
}
-(void)click{

    [_datePicker pushDatePicker];
}
//回调，字符串可自行进行截取
-(void)CDPDatePickerDidConfirm:(NSString *)confirmString{
    _label.text=confirmString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
