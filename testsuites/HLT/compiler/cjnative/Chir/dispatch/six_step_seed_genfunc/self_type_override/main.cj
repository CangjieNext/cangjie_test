/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 六步③本类型覆盖·泛型函数触发 | 对应 design-spec §3 第③步 + §7 DFX case3
 * 子类 A2 自身 override 覆盖父类 A1 与接口 I1 默认实现。
 * 触发形态: 泛型函数 k<T>(a: T) where T <: I1, 走按需查询真路径。
 * 预期: 实例化选取本类型 A2.foo,trace=[A2.foo],-O0/-O2 一致。
 */
// Level: 1
// Description:
// 六步种子(泛型函数版) 本类型(泛型函数触发) | 泛型函数实例化按需选型正向,与同 case 非泛型函数版对齐。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package geninst_case3_g

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

interface I1 {
    func foo(): Unit {
        __trace.append("[I1.foo]")
    }
}

open class A1 {
    public open func foo(): Unit {
        __trace.append("[A1.foo]")
    }
}

class A2 <: A1 & I1 {
    public override func foo(): Unit {
        __trace.append("[A2.foo]")
    }
}

func k<T>(a: T): Unit where T <: I1 {
    a.foo()
}


@Test
class SelfTypeOverrideTest {
    @TestCase
    func traceCheck(): Unit {

    k<A2>(A2())
        @Expect(__trace.toString(), "[A2.foo]")
    }
}
