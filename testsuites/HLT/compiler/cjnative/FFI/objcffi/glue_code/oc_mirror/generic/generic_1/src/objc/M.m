/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "M.h"

@implementation M

- (id)init {
    if (self = [super init]) {
        _a = 1;
        printf("in objc init\n");
    }
    return self;
}

@end

@implementation Box

- (instancetype)initWithContent:(id)content {
    self = [super init];
    if (self) {
        _content = content;
    }
    return self;
}

- (id)getContent {
    return _content;
}

- (void)printContentType {
    NSLog(@"盒子里的内容类型是: %@", [_content class]);
}