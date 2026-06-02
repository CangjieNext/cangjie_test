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
    CaseRunner<UInt8>().runCases(
        [
            //正数和正数比较,与顺序无关
            (max(UInt8(5), UInt8(8)), UInt8(8)),
            //正数和正数比较
            (max(UInt8(8), UInt8(5)), UInt8(8)),
            //相等的两个数返回较小值
            (max(UInt8(8), UInt8(8)), UInt8(8)),
            //0和正数比较
            (max(UInt8(0), UInt8(8)), UInt8(8)),
            //0和正数比较
            (max(UInt8(15), UInt8(0)), UInt8(15))
        ],
        description: "public func max(a: UInt8, b: UInt8): UInt8"
    )
    CaseRunner<UInt16>().runCases(
        [
            //正数和正数比较,与顺序无关
            (max(UInt16(5), UInt16(8)), UInt16(8)),
            //正数和正数比较
            (max(UInt16(8), UInt16(5)), UInt16(8)),
            //相等的两个数返回较小值
            (max(UInt16(8), UInt16(8)), UInt16(8)),
            //0和正数比较
            (max(UInt16(0), UInt16(8)), UInt16(8)),
            //0和正数比较
            (max(UInt16(15), UInt16(0)), UInt16(15))
        ],
        description: "public func max(a: UInt16, b: UInt16): UInt16"
    )
    CaseRunner<UInt32>().runCases(
        [
            //正数和正数比较,与顺序无关
            (max(UInt32(5), UInt32(8)), UInt32(8)),
            //正数和正数比较
            (max(UInt32(8), UInt32(5)), UInt32(8)),
            //相等的两个数返回较小值
            (max(UInt32(8), UInt32(8)), UInt32(8)),
            //0和正数比较
            (max(UInt32(0), UInt32(8)), UInt32(8)),
            //0和正数比较
            (max(UInt32(15), UInt32(0)), UInt32(15))
        ],
        description: "public func max(a: UInt32, b: UInt32): UInt32"
    )
    CaseRunner<UInt64>().runCases(
        [
            //正数和正数比较,与顺序无关
            (max(UInt64(5), UInt64(8)), UInt64(8)),
            //正数和正数比较
            (max(UInt64(8), UInt64(5)), UInt64(8)),
            //相等的两个数返回较小值
            (max(UInt64(8), UInt64(8)), UInt64(8)),
            //0和正数比较
            (max(UInt64(0), UInt64(8)), UInt64(8)),
            //0和正数比较
            (max(UInt64(15), UInt64(0)), UInt64(15))
        ],
        description: "public func max(a: UInt64, b: UInt64): UInt64"
    )
    return 0
}
