// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import <objc/runtime.h>
#import "M.h"

@implementation M
- (id) init {
    if (self = [super init]) {
        printf("objc: M init()\n");
    }

    return self;
}

- (F*) instantiateOptionF {
    printf("objc: instantiateOptionF\n");
    return [[F alloc] init];
}

- (F*) instantiateOptionFNil {
    printf("objc: instantiateOptionFNil\n");
    return nil;
}

- (void) oneParamOption: (F*) param {
    printf("objc: oneParamOption called");
    if (param == nil) {
        printf(" - param is nil\n");
    } else {
        printf(" - param is not nil\n");
        F* fOp = [param returnOption];
        [param optionParam:fOp];
        [param optionParam:nil];
    }
}

@end
