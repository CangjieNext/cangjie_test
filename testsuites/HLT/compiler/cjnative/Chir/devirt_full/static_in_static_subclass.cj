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
// Description: 子类接收者发起静态调用去虚化

// 子类接收者发起静态调用去虚化。
// 预言机：经子类 A2 接收者发起的静态调用，A2 无自身覆写，沿类链解析到继承的 A1.foo。
// 预期 trace：[A1.foo][A.bar][A1.foo][A.bar][A1.foo]
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
open class A1 <: A {
    public static func foo(): Int64 { __trace.append("[A1.foo]"); 1i64 }
}
class A2 <: A1 {}

@Test
class StaticInStaticSubclassTest {
    @TestCase
    func traceCheck(): Unit {
        let obj0: A1 = A1(); A1.foo(); A1.bar()
        let obj1: A2 = A2(); A2.bar()
        @Expect(__trace.toString(), "[A1.foo][A.bar][A1.foo][A.bar][A1.foo]")
    }
}

