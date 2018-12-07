//
//  AppDelegate+RegisterSdks.m
//  maybeTest
//
//  Created by maybee on 2018/10/9.
//  Copyright © 2018 maybee. All rights reserved.
//

#import "AppDelegate+RegisterSdks.h"
#import <iflyMSC/IFlySpeechUtility.h>
#import <AVOSCloud/AVOSCloud.h>
@implementation AppDelegate (RegisterSdks)

- (void)registerIfConfig{
    NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@", @"5bbc6c5d"];
    [IFlySpeechUtility createUtility:initString];
}
- (void)registerLeanCloud{
    [AVOSCloud setApplicationId:@"HKKbq67yrp7WV0ybnmCx2yPy-gzGzoHsz" clientKey:@"TYMV6Ks63cdxYWVcH9L2YQs8"];
    [AVOSCloud setAllLogsEnabled:YES];
}

@end
