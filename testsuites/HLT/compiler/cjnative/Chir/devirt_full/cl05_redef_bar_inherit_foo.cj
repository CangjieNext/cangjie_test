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
// Description: 子类重定义 bar、foo 继承时的解析

// 子类重定义 bar、foo 继承时的解析。
// 矩阵 §4.1。A2 重写 bar（不再走 A.bar），bar 内调 foo()；foo 由 A1 继承。
// A2.bar 内联后 foo 落在已知具体类 A2，解析到继承的 A1.foo。
// 预期 trace：[A2.bar][A1.foo]
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
    public static func bar(): Int64 { __trace.append("[A2.bar]"); return foo() }
}

@Test
class Cl05RedefBarInheritFooTest {
    @TestCase
    func traceCheck(): Unit {
        A2.bar()
        @Expect(__trace.toString(), "[A2.bar][A1.foo]")
    }
}

