/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "A.h"
#import <Foundation/Foundation.h>
#import <stdint.h>
#import <float.h>
#import <math.h>

int main(int argc, char** argv) {
    @autoreleasepool {
        A* a = [[A alloc] init];
        [a foo: INT8_MAX : INT16_MAX : INT32_MAX : INT64_MAX : UINT8_MAX : UINT16_MAX : UINT32_MAX : UINT64_MAX : FLT_MAX : DBL_MAX : true];
        [a bar: INT8_MIN : INT16_MIN : INT32_MIN : INT64_MIN : 0 : 0 : 0 : 0 : FLT_MIN : DBL_MIN : false];
    }
    return 0;
}
