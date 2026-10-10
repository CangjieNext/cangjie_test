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
// Description: 子接口继承并重定义默认 foo

// 子接口继承并重定义默认 foo。
// 矩阵 §4.2。接口 A：默认 foo + 默认 bar（bar 调 foo）；子接口 B <: A
// 重新声明 默认 foo（写 [B.foo]）；类 A1 <: B 不覆盖。经 A1 发起 bar()，foo 解析到
// 子接口的 重定义 默认 B.foo。
// 预期 trace：[A.bar][B.foo]
// 口径：编译/运行/O0-O2 语义差分；exit 0、cjc --test 报 PASSED:1 FAILED:0、O0 与 O2 运行结果一致。
package packageA
import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
var __trace: StringBuilder = StringBuilder()
interface A {
    static func foo(): Int64 { __trace.append("[A.foo]"); 1i64 }
    static func bar(): Int64 { __trace.append("[A.bar]"); return foo() }
}
interface B <: A {
    static func foo(): Int64 { __trace.append("[B.foo]"); 1i64 }
}
class A1 <: B {}

@Test
class If04SubifaceRedefDefaultFooTest {
    @TestCase
    func traceCheck(): Unit {
        A1.bar()
        @Expect(__trace.toString(), "[A.bar][B.foo]")
    }
}

