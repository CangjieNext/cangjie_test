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
// Description: 多跳静态调静态链的逐层解析

// 多跳静态调静态链 bar→baz→foo 的逐层解析。
// 矩阵 §4.3。接口 A 声明默认 foo、默认 baz（调 foo）、默认 bar（调 baz）。
// 经具体类 A1（覆写 foo）发起 bar()：bar 体调 baz、baz 体调 foo，两层调用各自按接收类型 A1 解析。
// 验证去虚化对多跳链仍逐层解析到正确目标，且 foo 在 A1 覆写而 baz/bar 继承接口默认。
// 预言机：多跳链中每一跳均按已知接收类型解析；bar、baz 解析到接口默认，foo 解析到 A1 覆写。
// 预期 trace：[A.bar][A.baz][A1.foo]
// 口径：编译/运行/O0-O2 语义差分；exit 0、cjc --test 报 PASSED:1 FAILED:0、O0 与 O2 运行结果一致。
package packageA
import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
var __trace: StringBuilder = StringBuilder()
interface A {
    public static func foo(): Int64 { __trace.append("[A.foo]"); 1i64 }
    public static func baz(): Int64 { __trace.append("[A.baz]"); return foo() }
    public static func bar(): Int64 { __trace.append("[A.bar]"); return baz() }
}
open class A1 <: A {
    public static func foo(): Int64 { __trace.append("[A1.foo]"); 1i64 }
}

@Test
class Sem03MultihopChainTest {
    @TestCase
    func traceCheck(): Unit {
        A1.bar()
        @Expect(__trace.toString(), "[A.bar][A.baz][A1.foo]")
    }
}
