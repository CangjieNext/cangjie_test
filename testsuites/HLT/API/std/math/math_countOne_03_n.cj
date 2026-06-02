/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: caserunner.cj
// EXEC: %compiler %cmp_opt %f caserunner.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not AssertionError
// ASSERT: scan-not Exception
import std.math.*

main() {
    var m82: Int8 = -5
    var n82: Int16 = -5
    var g82: Int32 = -5
    var f82: Int64 = -5
    CaseRunner<Int64>().runCases(
        [
            //不连续多个1
            (countOnes(m82), 3),
            (countOnes(n82), 3),
            (countOnes(g82), 3),
            (countOnes(f82), 3)
        ],
        description: "不连续1计算1的个数"
    )
    var m84: Int8 = 31
    var n84: Int16 = 31
    var g84: Int32 = 31
    var f84: Int64 = 31
    CaseRunner<Int64>().runCases(
        [
            //不连续多个1
            (countOnes(m84), 5),
            (countOnes(n84), 5),
            (countOnes(g84), 5),
            (countOnes(f84), 5)
        ],
        description: "连续1计算1的个数"
    )
    var m85: Int8 = -128
    var m86: Int8 = 127
    var n85: Int16 = -32768
    var n86: Int16 = 32767
    var g85: Int32 = -2147483648
    var g86: Int32 = 2147483647
    var f85: Int64 = -9223372036854775808
    var f86: Int64 = 9223372036854775807
    CaseRunner<Int64>().runCases(
        [
            //不连续多个1
            (countOnes(m85), 1),
            (countOnes(m86), 7),
            (countOnes(n85), 1),
            (countOnes(n86), 15),
            (countOnes(g85), 1),
            (countOnes(g86), 31),
            (countOnes(f85), 1),
            (countOnes(f86), 63)
        ],
        description: "边界值"
    )
    return 0
}
