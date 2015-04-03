//
//  CDPDatePicker.m
//  CDPDatePicker
//
//  Created by MAC on 15/3/30.
//  Copyright (c) 2015年 com.xuezi.CDP. All rights reserved.
//

#import "CDPDatePicker.h"

@implementation CDPDatePicker

-(id)initWithSelectTitle:(NSString *)title viewOfDelegate:(UIView *)view delegate:(id<CDPDatePickerDelegate>)delegate{
    if (self=[super init]) {
        _view=view;
        _delegate=delegate;
        _isBeforeTime=YES;
        _theTypeOfDatePicker=3;
        //生成日期选择器
        _datePickerView=[[UIView alloc] initWithFrame:CGRectMake(0,_view.bounds.size.height,_view.bounds.size.width,_view.bounds.size.height*0.42243)];
        _datePickerView.backgroundColor=[UIColor whiteColor];
        [_view addSubview:_datePickerView];
        
        _datePicker=[[UIDatePicker alloc]initWithFrame:CGRectMake(0,_view.bounds.size.height*0.07042,_view.bounds.size.width,0)];
        _datePicker.date =[NSDate date];
        _datePicker.datePickerMode = UIDatePickerModeDateAndTime;
        [_datePickerView addSubview:_datePicker];
        
        _dateLabel=[[UILabel alloc] initWithFrame:CGRectMake(0,0,_view.bounds.size.width/2,_view.bounds.size.height*0.07042)];
        if (title) {
            _dateLabel.text=title;
        }
        else{
            _dateLabel.text=@"年月日";
        }
        _dateLabel.textAlignment=NSTextAlignmentCenter;
        _dateLabel.textColor=[UIColor darkGrayColor];
        _dateLabel.backgroundColor=[UIColor whiteColor];
        [_datePickerView addSubview:_dateLabel];
        
        _dateConfirmButton=[[UIButton alloc] initWithFrame:CGRectMake(_view.bounds.size.width/2,0,_view.bounds.size.width/2,_view.bounds.size.height*0.07042)];
        [_dateConfirmButton setTitle:@"确定" forState:UIControlStateNormal];
        _dateConfirmButton.userInteractionEnabled=YES;
        [_dateConfirmButton addTarget:self action:@selector(dateConfirmClick) forControlEvents:UIControlEventTouchUpInside];
        [_dateConfirmButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _dateConfirmButton.backgroundColor=[UIColor grayColor];
        [_datePickerView addSubview:_dateConfirmButton];

    }
    
    return self;
}
//确定选择
-(void)dateConfirmClick{

    NSString *string=[NSString stringWithFormat:@"%@",[NSDate dateWithTimeInterval:3600*8 sinceDate:[_datePicker date]]];
    
    [self.delegate CDPDatePickerDidConfirm:string];
    
    [self popDatePicker];
    _datePicker.date =[NSDate date];


}
//是否可选择以前的时间
-(void)setIsBeforeTime:(BOOL)isBeforeTime{
    if (isBeforeTime==NO) {
        [_datePicker setMinimumDate:[NSDate date]];
    }
    else{
        [_datePicker setMinimumDate:[NSDate dateWithTimeIntervalSince1970:0]];
    }
}
//datePicker显示类别
-(void)setTheTypeOfDatePicker:(NSInteger)theTypeOfDatePicker{
    if (theTypeOfDatePicker==1) {
        //只显示时间
        _datePicker.datePickerMode = UIDatePickerModeTime;
    }
    else if(theTypeOfDatePicker==2){
        //只显示日期
        _datePicker.datePickerMode = UIDatePickerModeDate;
    }
    else if(theTypeOfDatePicker==3){
        //时间与日期都显示
        _datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    }
    else{
        NSLog(@"时间类别选择错误");
    }
}
#pragma mark pickerView动画效果
//出现
-(void)pushDatePicker{
    [UIView animateWithDuration:0.3 animations:^{
        _datePickerView.frame=CGRectMake(0,_view.bounds.size.height-_view.bounds.size.height*0.42243,_view.bounds.size.width,_view.bounds.size.height*0.42243);
    }];
}
//消失
-(void)popDatePicker{
    [UIView animateWithDuration:0.3 animations:^{
        _datePickerView.frame=CGRectMake(0,_view.bounds.size.height,_view.bounds.size.width,_view.bounds.size.height*0.42243);
    }];
}




-(void)dealloc{
    self.delegate=nil;
}



@end
