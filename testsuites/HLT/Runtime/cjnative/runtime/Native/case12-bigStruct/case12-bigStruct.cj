/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: %n.c
// (not Windows) EXEC: %clang -c %clang_opt %n.c -o lib%n.c.cfile.%cffi_suffix
// (not Windows) EXEC: %compiler -L. -l%n.c.cfile %f %cmp_opt %overflow_wrapping -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
/* SCAN-IN
C_Func-A1: a0 = 1, a2 = 2, a3 = 3, a4 = 4, a5 = 5, a6 = 6, a7 = 7, a8 = 8, a9 = 9, a10 = 10
C_Func-A2: a0 = 2, a2 = 2, a3 = 3, a4 = 4, a5 = 5, a6 = 6, a7 = 7, a8 = 8, a9 = 9, a10 = 10
C_Func-A3: a0 = 3, a2 = 2, a3 = 3, a4 = 4, a5 = 5, a6 = 6, a7 = 7, a8 = 8, a9 = 9, a10 = 10
C_Func-A4: a0 = 4, a2 = 2, a3 = 3, a4 = 4, a5 = 5, a6 = 6, a7 = 7, a8 = 8, a9 = 9, a10 = 10
C_Func-A5: a0 = 5, a2 = 2, a3 = 3, a4 = 4, a5 = 5, a6 = 6, a7 = 7, a8 = 8, a9 = 9, a10 = 10
C_Func-A6: a0 = 6, a2 = 2, a3 = 3, a4 = 4, a5 = 5, a6 = 6, a7 = 7, a8 = 8, a9 = 9, a10 = 10
C_Func-A7: a0 = 7, a2 = 2, a3 = 3, a4 = 4, a5 = 5, a6 = 6, a7 = 7, a8 = 8, a9 = 9, a10 = 10
C_Func-A8: a0 = 8, a2 = 2, a3 = 3, a4 = 4, a5 = 5, a6 = 6, a7 = 7, a8 = 8, a9 = 9, a10 = 10
C_Func-A9: a0 = 9, a2 = 2, a3 = 3, a4 = 4, a5 = 5, a6 = 6, a7 = 7, a8 = 8, a9 = 9, a10 = 10
C_Func-A10: a0 = 10, a2 = 2, a3 = 3, a4 = 4, a5 = 5, a6 = 6, a7 = 7, a8 = 8, a9 = 9, a10 = 10
10
2
3
4
5
6
7
8
9
10
 */

@C
struct RcdTest {
    public RcdTest(a1: Int64) {
        a0 = a1
    }
    public var a0: Int64
    public var a2: Int64 = 2
    public var a3: Int32 = 3
    public var a4: Int32 = 4
    public var a5: Int64 = 5
    public var a6: Int32 = 6
    public var a7: Int32 = 7
    public var a8: Int64 = 8
    public var a9: Int32 = 9
    public var a10: Int32 = 10
}

foreign func C_Func(a1: RcdTest, a2: RcdTest, a3: RcdTest, a4: RcdTest, a5: RcdTest, a6: RcdTest, a7: RcdTest,
    a8: RcdTest, a9: RcdTest, a10: RcdTest): RcdTest

main(): Int64 {
    var ret = unsafe { C_Func(RcdTest(1), RcdTest(2), RcdTest(3), RcdTest(4), RcdTest(5), RcdTest(6), RcdTest(7),
        RcdTest(8), RcdTest(9), RcdTest(10)) }
    println(ret.a0.toString())
    println(ret.a2.toString())
    println(ret.a3.toString())
    println(ret.a4.toString())
    println(ret.a5.toString())
    println(ret.a6.toString())
    println(ret.a7.toString())
    println(ret.a8.toString())
    println(ret.a9.toString())
    println(ret.a10.toString())
    if (ret.a10 == 10) {
        return 0
    }
    return 1
}
