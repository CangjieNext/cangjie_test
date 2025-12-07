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
        printf("getInt8=%d", [a getInt8] == INT8_MAX);
        printf("getInt16=%d", [a getInt16] == INT16_MAX);
        printf("getInt32=%d", [a getInt32] == INT32_MAX);
        printf("getInt64=%d", [a getInt64] == INT64_MAX);
        printf("getUInt8=%d", [a getUInt8] == UINT8_MAX);
        printf("getUInt16=%d", [a getUInt16] == UINT16_MAX);
        printf("getUInt32=%d", [a getUInt32] == UINT32_MAX);
        printf("getUInt64=%d", [a getUInt64] == UINT64_MAX);
        printf("getFloat32=%d", [a getFloat32] > 0.0);
        printf("getFloat64=%d", [a getFloat64] > 0.0);
        printf("getBool=%d", [a getBool] == true);
    }
    return 0;
}
