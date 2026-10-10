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
// Description: 两个具体泛型类实例静态隔离的解析

// 两个具体泛型类实例静态隔离的解析。
// 矩阵 §4.3。接口 A<T>：默认 foo + 默认 bar（bar 调 foo，foo 写 [A.foo]）。
// 泛型类 A1<T> <: A<T> 覆盖 foo（写 [A1.foo]）。分别实例化 A1<Int64> 与 A1<Float64>
// 各发起 bar()，两个实例的 静态 foo 互相隔离，各命中 A1.foo。
// 预期 trace：[A.bar][A1.foo][A.bar][A1.foo]
// 口径：编译/运行/O0-O2 语义差分；exit 0、cjc --test 报 PASSED:1 FAILED:0、O0 与 O2 运行结果一致。
package packageA
import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
var __trace: StringBuilder = StringBuilder()
interface A<T> {
    static func foo(): Int64 { __trace.append("[A.foo]"); 1i64 }
    static func bar(): Int64 { __trace.append("[A.bar]"); return foo() }
}
open class A1<T> <: A<T> {
    public static func foo(): Int64 { __trace.append("[A1.foo]"); 1i64 }
}

@Test
class Gen04TwoGenericClassInstancesIsolatedTest {
    @TestCase
    func traceCheck(): Unit {
        A1<Int64>.bar()
        A1<Float64>.bar()
        @Expect(__trace.toString(), "[A.bar][A1.foo][A.bar][A1.foo]")
    }
}

