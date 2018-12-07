//
//  MBAlertController.h
//  ComplainProject
//
//  Created by maybee on 2018/6/26.
//  Copyright © 2018年 maybee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MBAlertControllerType) {
    MBAlertControllerTypeActionSheet = 0,
    MBAlertControllerTypeAlert
};
@interface MBAlertController : UIAlertController

+ (instancetype)initMBAlerControllerWithTitle:(NSString *)title message:(NSString *)message style:(MBAlertControllerType)style titleArr:(NSMutableArray *)titleArr alerAction:(void (^)(NSInteger index))alerAction;

- (void)showAlert;
- (void)dismissAlert;
+ (UIViewController *)getCurrentVC;

@end
