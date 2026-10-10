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
// Description: 父类实现一接口、子类另增接口的混合解析

// 父类实现一接口、子类另增接口的混合解析。
// 矩阵 §4.1。父类 A1 实现接口 I（静态 foo + 默认 bar）；子类 A2 <: A1 额外
// 实现 J（静态 baz + 默认 qux）。I.bar 调 foo，J.qux 调 baz。经 A2 分别发起 bar()/qux()，
// foo 解析到继承的 A1.foo，baz 解析到 A2.baz。
// 预期 trace：[I.bar][A1.foo][J.qux][A2.baz]
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
    static func qux(): Int64 { __trace.append("[J.qux]"); return baz() }
}
open class A1 <: I {
    public static func foo(): Int64 { __trace.append("[A1.foo]"); 1i64 }
}
class A2 <: A1 & J {
    public static func baz(): Int64 { __trace.append("[A2.baz]"); 1i64 }
}

@Test
class Cl11ParentISubclassJTest {
    @TestCase
    func traceCheck(): Unit {
        A2.bar()
        A2.qux()
        @Expect(__trace.toString(), "[I.bar][A1.foo][J.qux][A2.baz]")
    }
}

