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
            //x,y均为正数且互质
            (gcd(UInt8(17), UInt8(19)), UInt8(1)),
            //顺序不影响最大公约数求法
            (gcd(UInt8(19), UInt8(17)), UInt8(1)),
            //x,y均为正数且有公因数
            (gcd(UInt8(32), UInt8(72)), UInt8(8)),
            //顺序不影响最大公约数求法
            (gcd(UInt8(32), UInt8(72)), UInt8(8)),
            //0和任何数的最大公约数都是0
            (gcd(UInt8(0), UInt8(5)), UInt8(5)),
            //1和任何数的最大公约数都是1
            (gcd(UInt8(32), UInt8(1)), UInt8(1))
        ],
        description: "public func gcd(x: UInt8, y: UInt8): UInt8"
    )
    CaseRunner<UInt16>().runCases(
        [
            //x,y均为正数且互质
            (gcd(UInt16(256), UInt16(143)), UInt16(1)),
            //顺序不影响最大公约数求法
            (gcd(UInt16(143), UInt16(256)), UInt16(1)),
            //x,y均为正数且有公因数
            (gcd(UInt16(256), UInt16(128)), UInt16(128)),
            //顺序不影响最大公约数求法
            (gcd(UInt16(256), UInt16(128)), UInt16(128)),
            //0和任何数的最大公约数都是0
            (gcd(UInt16(0), UInt16(256)), UInt16(256)),
            //1和任何数的最大公约数都是1
            (gcd(UInt16(256), UInt16(1)), UInt16(1))
        ],
        description: "public func gcd(x: UInt16, y: UInt16): UInt16"
    )

    CaseRunner<UInt32>().runCases(
        [
            //x,y均为正数且互质
            (gcd(UInt32(17), UInt32(2147483647)), UInt32(1)),
            //顺序不影响最大公约数求法
            (gcd(UInt32(2147483647), UInt32(17)), UInt32(1)),
            //x,y均为正数且有公因数
            (gcd(UInt32(1024), UInt32(512)), UInt32(512)),
            //顺序不影响最大公约数求法
            //0和任何数的最大公约数都是该数的绝对值
            (gcd(UInt32(0), UInt32(512)), UInt32(512)),
            //1和任何数的最大公约数都是1
            (gcd(UInt32(1), UInt32(512)), UInt32(1))
        ],
        description: "public func gcd(x: UInt32, y: UInt32): UInt32"
    )
    CaseRunner<UInt64>().runCases(
        [
            //x,y均为正数且互质
            (gcd(UInt64(922337203685477), UInt64(17)), UInt64(1)),
            //顺序不影响最大公约数求法
            (gcd(UInt64(922337203685477), UInt64(17)), UInt64(1)),
            //x,y均为正数且有公因数
            (gcd(UInt64(1024), UInt64(1024000000000000000)), UInt64(1024)),
            //顺序不影响最大公约数求法
            (gcd(UInt64(1024000000000000000), UInt64(1024)), UInt64(1024)),
            //0和任何数的最大公约数都是0
            (gcd(UInt64(0), UInt64(1024000000000000000)), UInt64(1024000000000000000)),
            //1和任何数的最大公约数都是1
            (gcd(UInt64(1024000000000000000), UInt64(1)), UInt64(1))
        ],
        description: "public func gcd(x: UInt64, y: UInt64): UInt64"
    )
    return 0
}
