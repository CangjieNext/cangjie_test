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
// Description: 无接口、caller 与 callee 只在基类定义、子类纯继承不重定义

// 无接口参与、caller(bar) 与 callee(foo) 仅定义于基类具体类、多层子类均不重定义。
// 矩阵 §4.1。open class A1 自带 foo 与 bar；open A2 <: A1、A3 <: A2 均不覆写任何静态方法。
// 经最深子类 A3 发起 bar()：bar 与 foo 均沿继承链解析到唯一实现 A1（无重定义分支）。
// 预言机：caller 与 callee 均不在子类重定义时，解析到继承链上唯一定义点，不产生多版本分支。
// 预期 trace：[A1.bar][A1.foo]
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
open class A2 <: A1 {}
class A3 <: A2 {}

@Test
class Cl15ConcreteInheritOnlyTest {
    @TestCase
    func traceCheck(): Unit {
        A3.bar()
        @Expect(__trace.toString(), "[A1.bar][A1.foo]")
    }
}
