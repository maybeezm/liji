//
//  MBNoteModel.h
//  maybeTest
//
//  Created by maybee on 2018/10/9.
//  Copyright © 2018 maybee. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MBNoteModel : NSObject

@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *emoji;
@property (nonatomic, copy) NSString *weather;
@property (nonatomic, assign) NSInteger isRemind;
@property (nonatomic, assign) NSInteger remindTimeInterval;

@end

