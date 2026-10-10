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
// Description: 多接口仅一个默认 foo 的解析

// 多接口仅一个默认 foo 的解析。
// 矩阵 §4.2。接口 I 提供默认 静态 foo + 默认 bar；接口 J 无 foo。
// 类 A1 <: I & J 不覆盖 foo。经 A1 发起 bar()，foo 解析到 I.foo（唯一 默认）。
// 预期 trace：[I.bar][I.foo]
// 口径：编译/运行/O0-O2 语义差分；exit 0、cjc --test 报 PASSED:1 FAILED:0、O0 与 O2 运行结果一致。
package packageA
import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
var __trace: StringBuilder = StringBuilder()
interface I {
    static func foo(): Int64 { __trace.append("[I.foo]"); 1i64 }
    static func bar(): Int64 { __trace.append("[I.bar]"); return foo() }
}
interface J {}
class A1 <: I & J {}

@Test
class Mi01SingleDefaultFooTest {
    @TestCase
    func traceCheck(): Unit {
        A1.bar()
        @Expect(__trace.toString(), "[I.bar][I.foo]")
    }
}

