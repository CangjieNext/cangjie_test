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
// Description: 子类同时重定义 caller 与 callee 的解析

// 子类同时重定义 caller(bar) 与 callee(foo) 的解析。
// 矩阵 §4.1。接口 A 默认 bar 调 foo；类 A1 覆写 foo；子类 A2 同时覆写 bar 与 foo。
// 经 A2 发起 bar()，bar 体用 A2 自己的版本，内层 foo 解析到 A2.foo（最近重定义），
// 不回落父类 A1.foo 也不回落接口默认 A.foo。
// 预言机：caller 与 callee 均在子类重定义时，二者都解析到子类自身实现。
// 预期 trace：[A2.bar][A2.foo]
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
    public static func foo(): Int64 { __trace.append("[A2.foo]"); 2i64 }
}

@Test
class Cl13SubclassRedefBothTest {
    @TestCase
    func traceCheck(): Unit {
        A2.bar()
        @Expect(__trace.toString(), "[A2.bar][A2.foo]")
    }
}
