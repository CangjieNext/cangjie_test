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
// Description: 无接口、caller 与 callee 在具体类且子类重定义两者

// 无接口参与、caller(bar) 与 callee(foo) 均定义于具体类、子类同时重定义两者。
// 矩阵 §4.1。open class A1 自带 foo 与 bar（bar 调 foo，无接口默认）；子类 A2 同时覆写 foo 与 bar。
// 分别经 A1、A2 发起 bar()：A1 路径解析到自身实现，A2 路径 bar 与 foo 均解析到 A2 自身版本。
// 预言机：caller 与 callee 完全位于具体类（不经接口默认）时，按各静态类型分别解析到对应类实现。
// 预期 trace：[A1.bar][A1.foo][A2.bar][A2.foo]
// 口径：编译/运行/O0-O2 语义差分；exit 0、cjc --test 报 PASSED:1 FAILED:0、O0 与 O2 运行结果一致。
package packageA
import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
var __trace: StringBuilder = StringBuilder()
open class A1 {
    public static func foo(): Int64 { __trace.append("[A1.foo]"); 1i64 }
    public static func bar(): Int64 { __trace.append("[A1.bar]"); return foo() }
}
class A2 <: A1 {
    public static func foo(): Int64 { __trace.append("[A2.foo]"); 2i64 }
    public static func bar(): Int64 { __trace.append("[A2.bar]"); return foo() }
}

@Test
class Cl14ConcreteBothRedefTest {
    @TestCase
    func traceCheck(): Unit {
        A1.bar()
        A2.bar()
        @Expect(__trace.toString(), "[A1.bar][A1.foo][A2.bar][A2.foo]")
    }
}
