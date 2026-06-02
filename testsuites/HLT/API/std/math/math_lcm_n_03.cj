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
            //x,y均为正数且互质,
            //(0 to 255)
            (lcm(UInt8(13), UInt8(19)), UInt8(247)),
            //顺序不影响最小公倍数求法
            (lcm(UInt8(19), UInt8(13)), UInt8(247)),
            //x,y均为正数且有公因数
            (lcm(UInt8(12), UInt8(16)), UInt8(48)),
            //顺序不影响最小公倍数求法
            (lcm(UInt8(16), UInt8(12)), UInt8(48)),
            //1和任何数的最小公倍数都是任何数
            (lcm(UInt8(32), UInt8(1)), UInt8(32)),
            //0和任何数的最小公倍数都是0
            (lcm(UInt8(0), UInt8(5)), UInt8(0))
        ],
        description: "public func lcm(x: UInt8, y: UInt8): UInt8"
    )
    CaseRunner<UInt16>().runCases(
        [
            //x,y均为正数且互质
            //(0 to 65535)
            (lcm(UInt16(256), UInt16(143)), UInt16(36608)),
            //顺序不影响最小公倍数求法
            (lcm(UInt16(143), UInt16(256)), UInt16(36608)),
            //x,y均为正数且有公因数
            (lcm(UInt16(256), UInt16(128)), UInt16(256)),
            //顺序不影响最小公倍数求法
            (lcm(UInt16(128), UInt16(256)), UInt16(256)),
            //1和任何数的最小公倍数都是任何数
            (lcm(UInt16(256), UInt16(1)), UInt16(256)),
            //0和任何数的最小公倍数都是0
            (lcm(UInt16(0), UInt16(256)), UInt16(0))
        ],
        description: "public func lcm(x: UInt16, y: UInt16): UInt16"
    )
    CaseRunner<UInt32>().runCases(
        [
            //x,y均为正数且互质
            //(0 to 4294967295)
            (lcm(UInt32(19), UInt32(13)), UInt32(247)),
            //顺序不影响最小公倍数求法,
            (lcm(UInt32(13), UInt32(19)), UInt32(247)),
            //x,y均为正数且有公因数
            (lcm(UInt32(56), UInt32(2)), UInt32(56)),
            //顺序不影响最小公倍数求法
            (lcm(UInt32(2), UInt32(56)), UInt32(56)),

            //1和任何数的最小公倍数都是任何数
            (lcm(UInt32(512), UInt32(1)), UInt32(512)),
            //0和任何数的最小公倍数都是0
            (lcm(UInt32(0), UInt32(512)), UInt32(0))
        ],
        description: "public func lcm(x: UInt32, y: UInt32): UInt32"
    )
    CaseRunner<UInt64>().runCases(
        [
            //x,y均为正数且互质
            //(0 to 18446744073709551615)
            (lcm(UInt64(29), UInt64(37)), UInt64(1073)),
            //顺序不影响最小公倍数求法
            (lcm(UInt64(37), UInt64(29)), UInt64(1073)),
            //x,y均为正数且有公因数
            (lcm(UInt64(1024), UInt64(1024000000)), UInt64(1024000000)),
            //顺序不影响最小公倍数求法
            (lcm(UInt64(1024), UInt64(1024000000)), UInt64(1024000000)),
            //1和任何数的最小公倍数都是任何数
            (lcm(UInt64(1024000000), UInt64(1)), UInt64(1024000000)),
            //0和任何数的最小公倍数都是0
            (lcm(UInt64(0), UInt64(1024000000)), UInt64(0))
        ],
        description: "public func lcm(x: UInt64, y: UInt64): UInt64"
    )
    return 0
}
