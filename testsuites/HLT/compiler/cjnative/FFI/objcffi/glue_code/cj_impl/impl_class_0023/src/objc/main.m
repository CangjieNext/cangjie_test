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
        printf("getInt8=%d", [A getInt8] == INT8_MAX);
        printf("getInt16=%d", [A getInt16] == INT16_MAX);
        printf("getInt32=%d", [A getInt32] == INT32_MAX);
        printf("getInt64=%d", [A getInt64] == INT64_MAX);
        printf("getUInt8=%d", [A getUInt8] == UINT8_MAX);
        printf("getUInt16=%d", [A getUInt16] == UINT16_MAX);
        printf("getUInt32=%d", [A getUInt32] == UINT32_MAX);
        printf("getUInt64=%d", [A getUInt64] == UINT64_MAX);
        printf("getFloat32=%d", [A getFloat32] > 0.0);
        printf("getFloat64=%d", [A getFloat64] > 0.0);
        printf("getBool=%d", [A getBool] == true);
    }
    return 0;
}
