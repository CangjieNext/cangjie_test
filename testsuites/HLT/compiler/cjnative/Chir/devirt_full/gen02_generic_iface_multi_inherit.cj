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
// Description: 泛型接口多级继承后实例化的解析

// 泛型接口多级继承后实例化的解析。
// 矩阵 §4.3。接口 A<T>：抽象静态 foo: T + 默认 bar: T。
// 子接口 B<T> <: A<T>；类 A1 <: B<Int64> 实现 foo。经 A1 发起 bar()，
// 实例化到 Int64 后 foo 解析到 A1.foo。
// 预期 trace：[A.bar][A1.foo]
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
interface B<T> <: A<T> {}
class A1 <: B<Int64> {
    public static func foo(): Int64 { __trace.append("[A1.foo]"); 1i64 }
}

@Test
class Gen02GenericIfaceMultiInheritTest {
    @TestCase
    func traceCheck(): Unit {
        A1.bar()
        @Expect(__trace.toString(), "[A.bar][A1.foo]")
    }
}

