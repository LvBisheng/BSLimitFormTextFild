//
//  PSLimitTextFild.m
//  PlaySalary
//
//  Created by lbs on 2018/10/18.
//  Copyright © 2018 Taojinjia. All rights reserved.
//

#import "BSLimitFormTextFild.h"
#import <objc/runtime.h>

@interface BSLimitFormTextFild() <UITextFieldDelegate>

@end
@implementation BSLimitFormTextFild

#pragma mark - Life Cycle && Initialize

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.delegate = self;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.delegate = self;
}

- (void)setDelegate:(id<UITextFieldDelegate>)delegate {
    [super setDelegate:delegate];
    if (delegate != self) {
        if (![delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
            // 代理没有实现该代理方法，就动态帮他实现
            // b表示反悔bool值; b@:表示没有参数;  b@:@表示有一个参数(文档：https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html)
            class_addMethod(delegate.class, @selector(textField:shouldChangeCharactersInRange:replacementString:), class_getMethodImplementation(self.class, @selector(textField:shouldChangeCharactersInRange:replacementString:)), "b@:@:@:@");
        } else {
            // 外部实现了该代理方法，就由外部决定是否可以编辑
        }
    }
}

#pragma mark - private action

- (BOOL)predicateWithRegex:(NSString *)regex
                      text:(NSString *)text
                 textField:(UITextField *)textField {
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    BOOL originMatch = YES;
    if (textField.text.length) {
        originMatch = [pred evaluateWithObject:textField.text];
    }
    if (originMatch) {
        //本来是符合规则的
        return [pred evaluateWithObject:text];
    }else{
        //本来不符合规则的话就清空(比如外部对该textFild set 一个不合规的text,当点击开始编辑时就要清空)
        textField.text = nil;
        return YES;
    }
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if (!toBeString.length) {
        return YES;
    }
    if (self.regex) {
        return [self predicateWithRegex:self.regex text:toBeString textField:textField];
    } else {
        return YES;
    }
}


@end


