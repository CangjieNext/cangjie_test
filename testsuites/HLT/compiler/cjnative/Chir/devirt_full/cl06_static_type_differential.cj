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
// Description: 按静态类型分别调用的语义差分

// 按静态类型分别调用的语义差分。
// 矩阵 §4.1。同一接收实例，分别以 A1、A2 静态类型发起 bar()，bar 内层 foo
// 应按各自静态类型解析：A1 路径 -> A1.foo，A2 路径 -> A2.foo（重定义）。
// 验证语义差分：两条调用 trace 不同但各自正确，O0/O2 须一致。
// (A2 未重写 bar，故 A2.bar() 复用继承的 A1.bar；但 bar 内的 foo() 按接收类型 A2 解析到 A2.foo)
// 预期 trace：[A1.bar][A1.foo][A1.bar][A2.foo]
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
    public static func foo(): Int64 { __trace.append("[A2.foo]"); 1i64 }
}

@Test
class Cl06StaticTypeDifferentialTest {
    @TestCase
    func traceCheck(): Unit {
        A1.bar()
        A2.bar()
        @Expect(__trace.toString(), "[A1.bar][A1.foo][A1.bar][A2.foo]")
    }
}

