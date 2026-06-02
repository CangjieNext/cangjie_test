/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var num1 = 2
    var num2: Int64 = 3

    var str = "hello world"
    var res1 = str[num1]
    var res1_1 = "hello world"[num1]
    var res2 = str[num2]
    var res3 = str[4]
    var res3_1 = "hello world"[4]
    var res4: Int64 = str.lastIndexOf(UInt8(UInt32(r'e'))) ?? -1
    var res5: Int64 = str.indexOf(UInt8(UInt32(r'e'))) ?? -1
    var res6: Int64 = "hello world".indexOf(UInt8(UInt32(r'e'))) ?? -1
    if (res1 == UInt8(UInt32(r'l')) && res1_1 == UInt8(UInt32(r'l')) && res2 == UInt8(UInt32(r'l')) && res3 == UInt8(UInt32(r'o')) &&
        res3_1 == UInt8(UInt32(r'o')) && res4 == 1 && res5 == 1 && res6 == 1) {
        return 0
    }
    return 1
}
