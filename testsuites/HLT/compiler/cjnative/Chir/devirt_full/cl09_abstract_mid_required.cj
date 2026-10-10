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
// Description: 抽象中间层传递必需静态、具体叶子补齐

// 抽象中间层传递必需静态、具体叶子补齐。
// 矩阵 §4.1。接口 A 声明抽象静态 foo 加默认 bar 调 foo，中间层以子接口 A1 继承 A 仍传递抽象 foo，
// 具体叶子 A2 实现接口 A1 并补齐 foo。经 A2 发起 bar()，bar 内联后 foo 解析到 A2.foo。
// 注：仓颉抽象类不能持有未实现的静态函数，故抽象中间层以子接口形态表达，语义等价。
// 预期 trace：[A.bar][A2.foo]
// 口径：编译/运行/O0-O2 语义差分；exit 0、cjc --test 报 PASSED:1 FAILED:0、O0 与 O2 运行结果一致。
package packageA
import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
var __trace: StringBuilder = StringBuilder()
interface A {
    static func foo(): Int64
    static func bar(): Int64 { __trace.append("[A.bar]"); return foo() }
}
interface A1 <: A {}
class A2 <: A1 {
    public static func foo(): Int64 { __trace.append("[A2.foo]"); 1i64 }
}

@Test
class Cl09AbstractMidRequiredTest {
    @TestCase
    func traceCheck(): Unit {
        A2.bar()
        @Expect(__trace.toString(), "[A.bar][A2.foo]")
    }
}

