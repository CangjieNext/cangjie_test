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
// Description: 子接口重定义 caller、callee 继承父接口默认

// 子接口重定义 caller(bar)、callee(foo) 继承父接口默认的解析。
// 矩阵 §4.2。接口 A 默认 foo 与默认 bar（调 foo）；子接口 B <: A 重定义 bar（仍调 foo）；
// 类 A1 实现 B 但不覆写 foo。经 A1 发起 bar()：bar 解析到子接口 B 的重定义版本，foo 继承 A 默认。
// 预言机：caller 在子接口重定义、callee 不重定义时，caller 命中子接口、callee 命中父接口默认。
// 预期 trace：[B.bar][A.foo]
// 口径：编译/运行/O0-O2 语义差分；exit 0、cjc --test 报 PASSED:1 FAILED:0、O0 与 O2 运行结果一致。
package packageA
import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
var __trace: StringBuilder = StringBuilder()
interface A {
    public static func foo(): Int64 { __trace.append("[A.foo]"); 1i64 }
    public static func bar(): Int64 { __trace.append("[A.bar]"); return foo() }
}
interface B <: A {
    public static func bar(): Int64 { __trace.append("[B.bar]"); return foo() }
}
class A1 <: B {}

@Test
class If06SubifaceRedefBarTest {
    @TestCase
    func traceCheck(): Unit {
        A1.bar()
        @Expect(__trace.toString(), "[B.bar][A.foo]")
    }
}
