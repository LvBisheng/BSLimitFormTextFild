//
//  PSLimitTextFild.h
//  PlaySalary
//
//  Created by lbs on 2018/10/18.
//  Copyright © 2018 Taojinjia. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *limitRegexPrice = @"^(\\d{0,5})(\\.[0-9]{0,2})?$"; // 最大值为 99999.99的价格正则表达式
static NSString *limitRegexInteger = @"^\\d*$"; // 只能输入阿拉伯数字
static NSString *limitRegexIntegerCount = @"^\\d{0,11}$";

@interface BSLimitFormTextFild : UITextField

@property (nonatomic, copy) NSString *regex; /**< 输入框内容的正则表达式 */


@end
