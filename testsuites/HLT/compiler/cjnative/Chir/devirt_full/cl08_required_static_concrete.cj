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
// Description: 必需静态由具体子类补齐后的解析

// 必需静态由具体子类补齐后的解析。
// 矩阵 §4.1。接口 A 声明抽象 静态 foo（required，无默认体）+ 默认 bar；bar 调 foo。
// 具体 子类 A1 补齐 foo。经 A1 发起 bar()，bar 内联后 foo 落在具体类 A1 的补齐实现。
// 预期 trace：[A.bar][A1.foo]
// 口径：编译/运行/O0-O2 语义差分；exit 0、cjc --test 报 PASSED:1 FAILED:0、O0 与 O2 运行结果一致。
package packageA
import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
var __trace: StringBuilder = StringBuilder()
interface A {
    public static func foo(): Int64
    public static func bar(): Int64 { __trace.append("[A.bar]"); return foo() }
}
class A1 <: A {
    public static func foo(): Int64 { __trace.append("[A1.foo]"); 1i64 }
}

@Test
class Cl08RequiredStaticConcreteTest {
    @TestCase
    func traceCheck(): Unit {
        A1.bar()
        @Expect(__trace.toString(), "[A.bar][A1.foo]")
    }
}

