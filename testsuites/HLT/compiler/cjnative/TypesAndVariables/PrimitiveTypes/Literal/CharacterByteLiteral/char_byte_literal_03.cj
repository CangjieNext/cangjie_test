/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var a = [UInt8(UInt32(r'\r')), UInt8(UInt32(r'\f')), UInt8(UInt32(r'\v')), UInt8(UInt32(r'\n')),
        UInt8(UInt32(r'\t')), UInt8(UInt32(r'\b')), UInt8(UInt32(r'\0')), UInt8(UInt32(r'\\')), UInt8(UInt32(r'\'')),
        UInt8(UInt32(r'\"'))]
    var b: Array<UInt8> = [13, 12, 11, 10, 9, 8, 0, 92, 39, 34]
    for (i in 0..a.size) {
        if (a[i] != b[i]) {
            return 1
        }
        if (!(a[i] is UInt8)) {
            return 2
        }
    }
    return 0
}
