//
//  MBNoteEditViewController.m
//  maybeTest
//
//  Created by maybee on 2018/10/9.
//  Copyright © 2018 maybee. All rights reserved.
//

#import "MBNoteEditViewController.h"
#import <YYKit.h>
#import "Masonry.h"
@interface MBNoteEditViewController ()
@property (nonatomic, strong) YYTextView *textView;
@property (nonatomic, strong) UIView *toolBar;
@end

@implementation MBNoteEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeUI];
}
- (void)makeUI{
    [self.view addSubview:self.textView];
    [self.view addSubview:self.toolBar];
    [self.toolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    UIView *lastView;
    for (int i = 0; i < 6; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.toolBar addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lastView?lastView.mas_right:self.toolBar.mas_left);
            make.width.mas_equalTo(30);
            make.top.bottom.equalTo(self.toolBar);
        }];
    }
}
- (YYTextView *)textView{
    if (!_textView) {
        _textView = [[YYTextView alloc] init];
        _textView.userInteractionEnabled = YES;
        _textView.textVerticalAlignment = YYTextVerticalAlignmentTop;
    }
    return _textView;
}
- (UIView *)toolBar{
    if (!_toolBar) {
        _toolBar = [[UIView alloc]init];
    }
    return _toolBar;
}
@end
