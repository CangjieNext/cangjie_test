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

// 自增减支持数值类型
main(): Int64 {
    var a1 = 0b0001_1000
    a1++
    if (a1 != 0b0001_1001) {
        return 1
    }
    a1--
    if (a1 != 0b0001_1000) {
        return 1
    }
    var a2 = 0o30
    a2++
    if (a2 != 0o31) {
        return 1
    }
    var a3 = 24
    a3++
    if (a3 != 25) {
        return 1
    }
    var a4 = 0x18
    a4++
    if (a4 != 0x19) {
        return 1
    }
    var a7 = [1, 2, 3]
    a7[0] += 1
    var a8 = [1, 2, 3]
    a8[0] += 1

    var f4 = 8
    f4++
    //    var bigIntNum1: bigInt = 100000000000000000000
    //    bigIntNum1++
    //    var bigFloatNum1: bigFloat = 1.1E500
    //    bigFloatNum1++

    return 0;
}
