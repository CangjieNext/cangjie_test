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
// Description: 两个具体类型实参并存、实例不串扰

// 两个具体类型实参并存、实例不串扰。
// 矩阵 §4.3。接口 A<T>：抽象静态 foo: T + 默认 bar: T。
// 类 A1Int <: A<Int64> 实现 foo（写 [A1Int.foo]）；类 A1Str <: A<String> 实现 foo（写 [A1Str.foo]）。
// 分别经两者发起 bar()，trace 各自命中，不串扰。
// 预期 trace：[A.bar][A1Int.foo][A.bar][A1Str.foo]
// 口径：编译/运行/O0-O2 语义差分；exit 0、cjc --test 报 PASSED:1 FAILED:0、O0 与 O2 运行结果一致。
package packageA
import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
var __trace: StringBuilder = StringBuilder()
interface A<T> {
    static func foo(): T
    static func bar(): T { __trace.append("[A.bar]"); return foo() }
}
class A1Int <: A<Int64> {
    public static func foo(): Int64 { __trace.append("[A1Int.foo]"); 1i64 }
}
class A1Str <: A<String> {
    public static func foo(): String { __trace.append("[A1Str.foo]"); "s" }
}

@Test
class Gen03TwoTypeargsNoCrosstalkTest {
    @TestCase
    func traceCheck(): Unit {
        A1Int.bar()
        A1Str.bar()
        @Expect(__trace.toString(), "[A.bar][A1Int.foo][A.bar][A1Str.foo]")
    }
}

