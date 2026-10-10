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
// Description: 同包公开静态的解析

// 同包公开静态的解析。
// 矩阵 §4.1。同包内接口 A 声明抽象静态 foo 加默认 bar 调 foo，公开类 A1 提供公开静态 foo。
// 同包调用方经 A1 发起 bar()，bar 内联后 foo 解析到 A1.foo。
// 注：跨包形态需多包构建，此处用同包公开静态表达等价语义。
// 预期 trace：[A.bar][A1.foo]
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
public open class A1 <: A {
    public static func foo(): Int64 { __trace.append("[A1.foo]"); 1i64 }
}

@Test
class Cl12SamepackagePublicStaticTest {
    @TestCase
    func traceCheck(): Unit {
        A1.bar()
        @Expect(__trace.toString(), "[A.bar][A1.foo]")
    }
}

