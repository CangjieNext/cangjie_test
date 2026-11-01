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
// Description: 父类实现接口、子类继承的解析

// 父类实现接口、子类继承的解析。
// 矩阵 §4.2。接口 A：默认 foo + 默认 bar；父类 A1 <: A 不覆盖；子类 A2 <: A1。
// 经 A2 发起 bar()，foo 解析到继承的接口默认 A.foo。
// 预期 trace：[A.bar][A.foo]
// 口径：编译/运行/O0-O2 语义差分；exit 0、cjc --test 报 PASSED:1 FAILED:0、O0 与 O2 运行结果一致。
package packageA
import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
var __trace: StringBuilder = StringBuilder()
interface A {
    static func foo(): Int64 { __trace.append("[A.foo]"); 1i64 }
    static func bar(): Int64 { __trace.append("[A.bar]"); return foo() }
}
open class A1 <: A {}
class A2 <: A1 {}

@Test
class Ci04ParentIfaceSubclassTest {
    @TestCase
    func traceCheck(): Unit {
        A2.bar()
        @Expect(__trace.toString(), "[A.bar][A.foo]")
    }
}

