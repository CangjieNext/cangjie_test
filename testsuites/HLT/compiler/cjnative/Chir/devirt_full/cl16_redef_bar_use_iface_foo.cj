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
// Description: 子类重定义 caller、callee 回落到接口默认

// 子类重定义 caller(bar)、callee(foo) 不在任何类覆写而回落接口默认的解析。
// 矩阵 §4.1。接口 A 默认 foo 与默认 bar（调 foo）；类 A1 不覆写 foo；
// 子类 A2 仅重定义 bar（调 foo），不覆写 foo。经 A2 发起 bar()：bar 命中 A2 重定义，
// 内层 foo 无类级覆写、回落接口默认 A.foo。
// 预言机：caller 在子类重定义、callee 无任何类级实现时，caller 命中子类、callee 命中接口默认。
// 预期 trace：[A2.bar][A.foo]
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
open class A1 <: A {}
class A2 <: A1 {
    public static func bar(): Int64 { __trace.append("[A2.bar]"); return foo() }
}

@Test
class Cl16RedefBarUseIfaceFooTest {
    @TestCase
    func traceCheck(): Unit {
        A2.bar()
        @Expect(__trace.toString(), "[A2.bar][A.foo]")
    }
}
