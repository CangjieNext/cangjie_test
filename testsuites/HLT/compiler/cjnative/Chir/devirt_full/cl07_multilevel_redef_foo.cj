/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

// Level: 1
// Description: 多级逐层重定义 foo 后最近重定义解析

// 多级逐层重定义 foo 后最近重定义解析。
// 矩阵 §4.1。A1/A2/A3 各自 重定义静态 foo；经 A3 发起 bar()，bar 内联后
// foo 应解析到最近 重定义（A3.foo）。
// 预期 trace：[A.bar][A3.foo]
// 口径：编译/运行/O0-O2 语义差分；exit 0、cjc --test 报 PASSED:1 FAILED:0、O0 与 O2 运行结果一致。
package packageA
import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
var __trace: StringBuilder = StringBuilder()
interface A {
    public static func foo(): Int64 { __trace.append("[A.foo]"); 1i64 }
    public static func bar(): Int64 { __trace.append("[A.bar]"); return foo() }
}
open class A1 <: A {
    public static func foo(): Int64 { __trace.append("[A1.foo]"); 1i64 }
}
open class A2 <: A1 {
    public static func foo(): Int64 { __trace.append("[A2.foo]"); 1i64 }
}
class A3 <: A2 {
    public static func foo(): Int64 { __trace.append("[A3.foo]"); 1i64 }
}

@Test
class Cl07MultilevelRedefFooTest {
    @TestCase
    func traceCheck(): Unit {
        A3.bar()
        @Expect(__trace.toString(), "[A.bar][A3.foo]")
    }
}

