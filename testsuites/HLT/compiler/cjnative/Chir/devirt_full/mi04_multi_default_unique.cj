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
// Description: 多接口默认不冲突、依赖唯一默认

// 多接口默认不冲突、依赖唯一默认。
// 矩阵 §4.2。接口 I 提供默认静态 foo 加默认 bar 调 foo，接口 J 提供无关默认 baz（不与 I 冲突）。
// 类 A1 实现接口 I 与 J 不覆写。经 A1 发起 bar()，foo 解析到唯一默认 I.foo。
// 此条强调多默认不冲突、依赖唯一默认的语义判别（与一条同形用例互补，此条额外在 J 上加一个无关默认方法 baz 以贴近多默认语义）。
// 预期 trace：[I.bar][I.foo]
// 口径：编译/运行/O0-O2 语义差分；exit 0、cjc --test 报 PASSED:1 FAILED:0、O0 与 O2 运行结果一致。
package packageA
import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
var __trace: StringBuilder = StringBuilder()
interface I {
    static func foo(): Int64 { __trace.append("[I.foo]"); 1i64 }
    static func bar(): Int64 { __trace.append("[I.bar]"); return foo() }
}
interface J {
    static func baz(): Int64 { __trace.append("[J.baz]"); 1i64 }
}
class A1 <: I & J {}

@Test
class Mi04MultiDefaultUniqueTest {
    @TestCase
    func traceCheck(): Unit {
        A1.bar()
        @Expect(__trace.toString(), "[I.bar][I.foo]")
    }
}

