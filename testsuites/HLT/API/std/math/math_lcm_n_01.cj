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
            //x,y均为正数且互质,
            (lcm(Int8(11), Int8(9)), Int8(99)),
            //x,y均为负数且互质
            (lcm(Int8(-11), Int8(-9)), Int8(99)),
            //x,y有一个是负数且互质
            (lcm(Int8(11), Int8(-9)), Int8(99)),
            (lcm(Int8(-11), Int8(-9)), Int8(99)),
            //顺序不影响最大公约数求法
            (lcm(Int8(-9), Int8(-11)), Int8(99)),
            //x,y均为正数且有公因数
            (lcm(Int8(6), Int8(15)), Int8(30)),
            //x,y均为负数且有公因数
            (lcm(Int8(-6), Int8(-15)), Int8(30)),
            //x,y有一个是负数且有公因数
            (lcm(Int8(6), Int8(-15)), Int8(30)),
            (lcm(Int8(-6), Int8(15)), Int8(30)),
            //顺序不影响最大公约数求法
            (lcm(Int8(15), Int8(-6)), Int8(30)),
            //1和任何数的最小公倍数是它本身
            (lcm(Int8(6), Int8(1)), Int8(6)),
            (lcm(Int8(-6), Int8(1)), Int8(6)),
            //0和任何数的最小公倍数是0
            (lcm(Int8(0), Int8(5)), Int8(0)),
            (lcm(Int8(0), Int8(-25)), Int8(0))
        ],
        description: "public func lcm(x: Int8, y: Int8): Int8"
    )
    CaseRunner<Int16>().runCases(
        [
            //x,y均为正数且互质
            //(-32768 to 32767)
            (lcm(Int16(23), Int16(3)), Int16(69)),
            //x,y均为负数且互质
            (lcm(Int16(-23), Int16(-3)), Int16(69)),
            //x,y有一个是负数且互质
            (lcm(Int16(3), Int16(-23)), Int16(69)),
            (lcm(Int16(-3), Int16(23)), Int16(69)),
            //顺序不影响最大公约数求法
            (lcm(Int16(23), Int16(-3)), Int16(69)),

            //x,y均为正数且有公因数
            (lcm(Int16(126), Int16(63)), Int16(126)),
            //x,y均为负数且有公因数
            (lcm(Int16(-126), Int16(-63)), Int16(126)),
            //x,y有一个是负数且有公因数
            (lcm(Int16(126), Int16(-63)), Int16(126)),
            (lcm(Int16(-126), Int16(63)), Int16(126)),
            //顺序不影响最大公约数求法
            (lcm(Int16(63), Int16(-126)), Int16(126)),

            //1和任何数的最小公倍数是它本身
            (lcm(Int16(256), Int16(1)), Int16(256)),
            (lcm(Int16(-256), Int16(1)), Int16(256)),
            //0和任何数的最小公倍数是0
            (lcm(Int16(0), Int16(256)), Int16(0)),
            (lcm(Int16(0), Int16(-256)), Int16(0))
        ],
        description: "public func lcm(x: Int16, y: Int16): Int16"
    )
    CaseRunner<Int32>().runCases(
        [
            //x,y均为正数且互质
            //(-2147483648 to 2147483647)
            (lcm(Int32(19), Int32(13)), Int32(247)),
            //x,y均为负数且互质
            (lcm(Int32(-19), Int32(-13)), Int32(247)),
            //x,y有一个是负数且互质
            (lcm(Int32(19), Int32(-13)), Int32(247)),
            (lcm(Int32(-19), Int32(-13)), Int32(247)),
            //顺序不影响最大公约数求法
            (lcm(Int32(-13), Int32(-19)), Int32(247)),

            //x,y均为正数且有公因数
            (lcm(Int32(4444), Int32(666)), Int32(1479852)),
            //x,y均为负数且有公因数
            (lcm(Int32(-4444), Int32(-666)), Int32(1479852)),
            //x,y有一个是负数且有公因数
            (lcm(Int32(4444), Int32(-666)), Int32(1479852)),
            (lcm(Int32(-4444), Int32(-666)), Int32(1479852)),
            //顺序不影响最大公约数求法
            (lcm(Int32(-666), Int32(-4444)), Int32(1479852)),

            //1和任何数的最小公倍数是它本身
            (lcm(Int32(512), Int32(1)), Int32(512)),
            (lcm(Int32(-512), Int32(1)), Int32(512)),
            //0和任何数的最小公倍数是0
            (lcm(Int32(0), Int32(512)), Int32(0)),
            (lcm(Int32(0), Int32(-512)), Int32(0))
        ],
        description: "public func lcm(x: Int32, y: Int32): Int32"
    )
    CaseRunner<Int64>().runCases(
        [
            //x,y均为正数且互质
            //(-9223372036854775808 to 9223372036854775807)
            (lcm(Int64(29), Int64(37)), Int64(1073)),
            //x,y均为负数且互质
            (lcm(Int64(-29), Int64(-37)), Int64(1073)),
            //x,y有一个是负数且互质
            (lcm(Int64(29), Int64(-37)), Int64(1073)),
            (lcm(Int64(-29), Int64(37)), Int64(1073)),
            //顺序不影响最大公约数求法
            (lcm(Int64(-37), Int64(29)), Int64(1073)),

            //x,y均为正数且有公因数
            (lcm(Int64(1024), Int64(1024000000)), Int64(1024000000)),
            //x,y均为负数且有公因数
            (lcm(Int64(-1024), Int64(-1024000000)), Int64(1024000000)),
            //x,y有一个是负数且有公因数
            (lcm(Int64(1024000000), Int64(-1024)), Int64(1024000000)),
            (lcm(Int64(-1024000000), Int64(1024)), Int64(1024000000)),
            //顺序不影响最大公约数求法
            (lcm(Int64(1024), Int64(-1024000000)), Int64(1024000000)),

            //1和任何数的最小公倍数是它本身
            (lcm(Int64(1024000000), Int64(1)), Int64(1024000000)),
            (lcm(Int64(-1024000000), Int64(1)), Int64(1024000000)),
            //0和任何数的最小公倍数是0
            (lcm(Int64(0), Int64(1024000000)), Int64(0)),
            (lcm(Int64(0), Int64(-1024000000)), Int64(0))
        ],
        description: "public func lcm(x: Int64, y: Int64): Int64"
    )
    return 0
}
