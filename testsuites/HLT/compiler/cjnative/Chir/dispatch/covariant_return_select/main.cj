/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * TC-GENINST-COVARIANT-RETURN | 协变返回类型实例化选型 | P0 External
 * 需求 design-spec §7: A1.foo 返回 Return2 覆盖 I1.foo 返回 Return1(Return2 <: Return1)。
 * 预期: 实例化选取 A1.foo(输出 A1),-O0/-O2 一致。
 * cjc 1.3.0-alpha.02 实测支持(编译通过,输出 A1)。
 * cjc 1.3.0 实测支持协变返回,本套件直接落 design-spec 源码。
 */
// Level: 1
// Description:
// 协变返回类型实例化选型 | 实例化选取 A1.foo(返回 Return2 覆盖 Return1),输出 A1。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,trace 命中 [A1](协变返回选取 A1 版本),stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args


package packageA

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

open class Return1 {}

class Return2 <: Return1 {}

interface I1 {
    func foo(): Return1 { __trace.append("[I1]"); Return1() }
}

class A1 <: I1 {
    public func foo(): Return2 { __trace.append("[A1]"); Return2() } // 选取这个。
}

func k<T>(a: T): Unit where T <: I1 {
    a.foo()
}


@Test
class CovariantReturnSelectTest {
    @TestCase
    func traceCheck(): Unit {
    k<A1>(A1())
        @Expect(__trace.toString(), "[A1]")
    }
}
