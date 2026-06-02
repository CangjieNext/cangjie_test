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
    var a1: Int64 = 0b0110000000000000000000000000000000000000000000000000000000000000 ////Int64:6917529027641081856,对应的二进制
    CaseRunner<Int64>().runCases(
        [
            (rotate(a1, Int8(-65)), Int64(3458764513820540928)),
            (rotate(a1, Int8(65)), Int64(-4611686018427387904))
        ],
        description: "num>0,d的绝对值大于num的位数" //注意二进制num无法表示负数
    )
    CaseRunner<Int64>().runCases(
        [
            (rotate(a1, Int8(0)), Int64(6917529027641081856)),
            (rotate(a1, Int8(-0)), Int64(6917529027641081856))
        ],
        description: "d=0,不移动"
    )

    var b1: Int64 = 0b011111111111111111111111111111111111111111111111111111111111110 //Int64:4611686018427387902,对应的二进制
    var b2: Int64 = 0b0110000000000000000000000000000000000000000000000000000000000000 //Int64:6917529027641081856,对应的二进制
    CaseRunner<Int64>().runCases(
        [
            (rotate(b1, Int8(1)), Int64(9223372036854775804)),
            (rotate(b2, Int8(1)), Int64(-4611686018427387904))
        ],
        description: "num>0,d>0.左移"
    )

    var c1: Int64 = 0b0111111111111111111111111111111111111111111111111111111111111111 //Int64:9223372036854775807,对应的二进制
    var c2: Int64 = 0b0111111111111111111111111111111111111111111111111111111111111000 //Int64:9223372036854775800,对应的二进制

    CaseRunner<Int64>().runCases(
        [
            (rotate(c1, Int8(-1)), Int64(-4611686018427387905)),
            (rotate(c2, Int8(-1)), Int64(4611686018427387900))
        ],
        description: "num>0,d<0.右移"
    )

    return 0
}
