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
    var a5: Array<UInt8> = [9, 97, 32, 98, 99, 32]
    var r5 = String.fromUtf8(a5[0..5]).trimAscii()
    var r6 = String.fromUtf8([32u8, 9u8, 10u8, 11u8, 65u8, 97u8, 12u8, 13u8][0..8]).trimAscii()
    if (r5 != "a bc") {
        return 5
    }
    if (r6 != "Aa") {
        return 6
    }
    return 0
}
