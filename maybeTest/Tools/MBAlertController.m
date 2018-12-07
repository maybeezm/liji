//
//  MBAlertController.m
//  ComplainProject
//
//  Created by maybee on 2018/6/26.
//  Copyright © 2018年 maybee. All rights reserved.
//

#import "MBAlertController.h"

@interface MBAlertController ()

@end

@implementation MBAlertController

+ (instancetype)initMBAlerControllerWithTitle:(NSString *)title message:(NSString *)message style:(MBAlertControllerType)style titleArr:(NSMutableArray *)titleArr alerAction:(void (^)(NSInteger index))alerAction{
    //参数说明:
    //title表示弹框的标题;
    //message表示弹框的展示的信息;
    //style是0或者1;代表弹框的类型;UIAlertControllerStyleActionSheet = 0,UIAlertControllerStyleAlert = 1;
    //titleArr为弹框中出现的按钮标题的数组;个数你自己决定;
    //alerAction为block回调时间,因为这里只需要判断点击的按钮坐标就可以,其他需要壳自行添加参数;
    
    if (style == MBAlertControllerTypeActionSheet) {
        MBAlertController *alert = [MBAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
        for (NSInteger i = 0; i < titleArr.count; i++) {
            UIAlertAction *confirm = [UIAlertAction actionWithTitle:[titleArr objectAtIndex:i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if (alerAction) {
                    alerAction(i);
                }
            }];
            [alert addAction:confirm];
        }
        return alert;
    }else{
        MBAlertController *alert = [MBAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        for (NSInteger i = 0; i < titleArr.count; i++) {
            UIAlertAction *confirm = [UIAlertAction actionWithTitle:[titleArr objectAtIndex:i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if (alerAction) {
                    alerAction(i);
                }
            }];
            [alert addAction:confirm];
        }
        return alert;
    }
}
-(void)showAlert{
    [[MBAlertController getCurrentVC] presentViewController:self animated:YES completion:nil];
}
- (void)dismissAlert{
    [[MBAlertController getCurrentVC] dismissViewControllerAnimated:YES completion:NO];
}
+ (UIViewController *)getCurrentVC{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal){
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tempWindow in windows){
            if (tempWindow.windowLevel == UIWindowLevelNormal){
                window = tempWindow;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    return result;
}

- (void)dealloc {
    NSLog(@"%@-释放了",self.class);
}

@end
