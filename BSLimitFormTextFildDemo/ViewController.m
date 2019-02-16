//
//  ViewController.m
//  BSLimitFormTextFildDemo
//
//  Created by lbs on 2018/12/29.
//  Copyright © 2018 lbs. All rights reserved.
//

#import "ViewController.h"
#import "BSLimitFormTextFild.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet BSLimitFormTextFild *nomalTF;
@property (weak, nonatomic) IBOutlet BSLimitFormTextFild *priceTF;
@property (weak, nonatomic) IBOutlet BSLimitFormTextFild *integerTF;
@property (weak, nonatomic) IBOutlet BSLimitFormTextFild *limitCountTF;
@property (weak, nonatomic) IBOutlet BSLimitFormTextFild *customTF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 只能输入价格
    self.priceTF.regex = limitRegexPrice;
    // 只能输入整数
    self.integerTF.regex = limitRegexInteger;
    // 最多只能输入11位整数
    self.limitCountTF.regex = limitRegexIntegerCount;
    
    self.customTF.delegate = self;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (toBeString.length > 2) {
        NSLog(@"最多只能输入两个字");
        return NO;
    } else {
        return YES;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}


@end
