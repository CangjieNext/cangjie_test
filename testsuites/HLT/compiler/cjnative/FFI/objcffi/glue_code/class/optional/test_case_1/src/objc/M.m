/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "M.h"
@implementation M
- (id)init{
self = [super init];
return self;
}
- (void)foo:(int *)p {
    int value = *p;
    NSLog(@"value = %d", value);
}

@end
