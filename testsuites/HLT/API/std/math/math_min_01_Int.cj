/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: caserunner.cj
// EXEC: %compiler %cmp_opt %f caserunner.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not AssertionError
// ASSERT: scan-not Exception
import std.math.*

main() {
    CaseRunner<Int8>().runCases(
        [
            //正数和正数比较
            (min(Int8(5), Int8(9)), Int8(5)),
            //顺序
            (min(Int8(9), Int8(5)), Int8(5)),
            //相等的两个数返回较小值
            (min(Int8(5), Int8(5)), Int8(5)),
            //0和正数比较
            (min(Int8(0), Int8(5)), Int8(0)),
            //0和负数数比较
            (min(Int8(0), Int8(-25)), Int8(-25)),
            //负数和负数比较
            (min(Int8(-8), Int8(-25)), Int8(-25)),
            // 负数和正数比较
            (min(Int8(-8), Int8(25)), Int8(-8))
        ],
        description: "public func min(a: Int8, b: Int8): Int8"
    )
    CaseRunner<Int16>().runCases(
        [
            //正数和正数比较
            (min(Int16(5), Int16(9)), Int16(5)),
            //顺序
            (min(Int16(9), Int16(5)), Int16(5)),
            //相等的两个数返回较小值
            (min(Int16(5), Int16(5)), Int16(5)),
            //0和正数比较
            (min(Int16(0), Int16(5)), Int16(0)),
            //0和负数数比较
            (min(Int16(0), Int16(-25)), Int16(-25)),
            //负数和负数比较
            (min(Int16(-8), Int16(-25)), Int16(-25)),
            // 负数和正数比较
            (min(Int16(-8), Int16(25)), Int16(-8))
        ],
        description: "public func min(a: Int16, b: Int16): Int16"
    )
    CaseRunner<Int32>().runCases(
        [
            //正数和正数比较
            (min(Int32(5), Int32(9)), Int32(5)),
            //顺序
            (min(Int32(9), Int32(5)), Int32(5)),
            //相等的两个数返回较小值
            (min(Int32(5), Int32(5)), Int32(5)),
            //0和正数比较
            (min(Int32(0), Int32(5)), Int32(0)),
            //0和负数数比较
            (min(Int32(0), Int32(-25)), Int32(-25)),
            //负数和负数比较
            (min(Int32(-8), Int32(-25)), Int32(-25)),
            // 负数和正数比较
            (min(Int32(-8), Int32(25)), Int32(-8))
        ],
        description: "public func min(a: Int32, b: Int32): Int32"
    )
    CaseRunner<Int64>().runCases(
        [
            //正数和正数比较
            (min(Int64(5), Int64(9)), Int64(5)),
            //顺序
            (min(Int64(9), Int64(5)), Int64(5)),
            //相等的两个数返回较小值
            (min(Int64(5), Int64(5)), Int64(5)),
            //0和正数比较
            (min(Int64(0), Int64(5)), Int64(0)),
            //0和负数数比较
            (min(Int64(0), Int64(-25)), Int64(-25)),
            //负数和负数比较
            (min(Int64(-8), Int64(-25)), Int64(-25)),
            // 负数和正数比较
            (min(Int64(-8), Int64(25)), Int64(-8))
        ],
        description: "public func min(a: Int64, b: Int64): Int64"
    )

    return 0
}
