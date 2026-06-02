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
            //x,y均为正数且互质
            (gcd(Int8(17), Int8(19)), Int8(1)),
            //x,y均为负数且互质
            (gcd(Int8(-17), Int8(-19)), Int8(1)),
            //x,y有一个是负数且互质
            (gcd(Int8(17), Int8(-19)), Int8(1)),
            (gcd(Int8(-17), Int8(-19)), Int8(1)),
            //顺序不影响最大公约数求法
            (gcd(Int8(-19), Int8(-17)), Int8(1)),

            //x,y均为正数且有公因数
            (gcd(Int8(32), Int8(72)), Int8(8)),
            //x,y均为负数且有公因数
            (gcd(Int8(-32), Int8(-72)), Int8(8)),
            //x,y有一个是负数且有公因数
            (gcd(Int8(72), Int8(-32)), Int8(8)),
            (gcd(Int8(-72), Int8(32)), Int8(8)),
            //顺序不影响最大公约数求法
            (gcd(Int8(32), Int8(-72)), Int8(8)),

            //0和正数的最大公约数是正数
            (gcd(Int8(0), Int8(5)), Int8(5)),
            //0与负数的最大公约数是负数的绝对值
            (gcd(Int8(0), Int8(-25)), Int8(25)),

            //1和任何数的最大公约数都是1
            (gcd(Int8(32), Int8(1)), Int8(1)),
            (gcd(Int8(-25), Int8(1)), Int8(1))
        ],
        description: "public func gcd(x: Int8, y: Int8): Int8"
    )

    CaseRunner<Int16>().runCases(
        [
            //x,y均为正数且互质
            (gcd(Int16(256), Int16(143)), Int16(1)),
            //x,y均为负数且互质
            (gcd(Int16(-256), Int16(-143)), Int16(1)),
            //x,y有一个是负数且互质
            (gcd(Int16(256), Int16(-143)), Int16(1)),
            (gcd(Int16(-256), Int16(143)), Int16(1)),
            //顺序不影响最大公约数求法
            (gcd(Int16(-143), Int16(-256)), Int16(1)),

            //x,y均为正数且有公因数
            (gcd(Int16(256), Int16(128)), Int16(128)),
            //x,y均为负数且有公因数
            (gcd(Int16(-256), Int16(-128)), Int16(128)),
            //x,y有一个是负数且有公因数
            (gcd(Int16(128), Int16(-256)), Int16(128)),
            (gcd(Int16(-128), Int16(256)), Int16(128)),
            //顺序不影响最大公约数求法
            (gcd(Int16(256), Int16(-128)), Int16(128)),

            //0和任何数的最大公约数都是0
            (gcd(Int16(0), Int16(256)), Int16(256)),
            (gcd(Int16(0), Int16(-256)), Int16(256)),

            //1和任何数的最大公约数都是1
            (gcd(Int16(256), Int16(1)), Int16(1)),
            (gcd(Int16(-256), Int16(1)), Int16(1))
        ],
        description: "public func gcd(x: Int16, y: Int16): Int16"
    )

    //重载func gcd(x: Int32, y: Int32)：Int32
    CaseRunner<Int32>().runCases(
        [
            //x,y均为正数且互质
            (gcd(Int32(2147483647), Int32(17)), Int32(1)),
            //x,y均为负数且互质
            (gcd(Int32(-17), Int32(-2147483647)), Int32(1)),
            //x,y有一个是负数且互质
            (gcd(Int32(17), Int32(-2147483647)), Int32(1)),
            (gcd(Int32(-17), Int32(-2147483647)), Int32(1)),
            //顺序不影响最大公约数求法
            (gcd(Int32(-2147483647), Int32(-17)), Int32(1)),

            //x,y均为正数且有公因数
            (gcd(Int32(1024), Int32(512)), Int32(512)),
            //x,y均为负数且有公因数
            (gcd(Int32(-1024), Int32(-512)), Int32(512)),
            //x,y有一个是负数且有公因数
            (gcd(Int32(512), Int32(-1024)), Int32(512)),
            (gcd(Int32(-512), Int32(1024)), Int32(512)),
            //顺序不影响最大公约数求法
            (gcd(Int32(1024), Int32(-512)), Int32(512)),

            //0和任何数的最大公约数都是0
            (gcd(Int32(0), Int32(512)), Int32(512)),
            (gcd(Int32(0), Int32(-512)), Int32(512)),

            //1和任何数的最大公约数都是1
            (gcd(Int32(512), Int32(1)), Int32(1)),
            (gcd(Int32(-512), Int32(1)), Int32(1))
        ],
        description: "public func gcd(x: Int32, y: Int32): Int32"
    )
    CaseRunner<Int64>().runCases(
        [
            //x,y均为正数且互质
            (gcd(Int64(922337203685477), Int64(17)), Int64(1)),
            //x,y均为负数且互质
            (gcd(Int64(-17), Int64(-922337203685477)), Int64(1)),
            //x,y有一个是负数且互质
            (gcd(Int64(17), Int64(-922337203685477)), Int64(1)),
            (gcd(Int64(-17), Int64(-922337203685477)), Int64(1)),
            //顺序不影响最大公约数求法
            (gcd(Int64(-922337203685477), Int64(-17)), Int64(1)),

            //x,y均为正数且有公因数
            (gcd(Int64(1024), Int64(1024000000000000000)), Int64(1024)),
            //x,y均为负数且有公因数
            (gcd(Int64(-1024), Int64(-1024000000000000000)), Int64(1024)),
            //x,y有一个是负数且有公因数
            (gcd(Int64(1024000000000000000), Int64(-1024)), Int64(1024)),
            (gcd(Int64(-1024000000000000000), Int64(1024)), Int64(1024)),
            //顺序不影响最大公约数求法
            (gcd(Int64(1024), Int64(-1024000000000000000)), Int64(1024)),

            //0和任何数的最大公约数都是0
            (gcd(Int64(0), Int64(1024000000000000000)), Int64(1024000000000000000)),
            (gcd(Int64(0), Int64(-1024000000000000000)), Int64(1024000000000000000)),

            //1和任何数的最大公约数都是1
            (gcd(Int64(1024000000000000000), Int64(1)), Int64(1)),
            (gcd(Int64(-1024000000000000000), Int64(1)), Int64(1))
        ],
        description: "public func gcd(x: Int64, y: Int64): Int64"
    )
    return 0
}
