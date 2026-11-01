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
// Description: 子类重定义静态 foo 后最近重定义解析

// 子类重定义静态 foo 后最近重定义解析。
// 矩阵 §4.1。A1 与 A2 各自提供 静态 foo；经 A2 发起 bar()，bar 内联后内层 foo
// 应解析到最近 重定义（A2.foo）。
// 预期 trace：[A.bar][A2.foo]
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
class A2 <: A1 {
    public static func foo(): Int64 { __trace.append("[A2.foo]"); 1i64 }
}

@Test
class Cl04SubclassRedefFooTest {
    @TestCase
    func traceCheck(): Unit {
        A2.bar()
        @Expect(__trace.toString(), "[A.bar][A2.foo]")
    }
}

