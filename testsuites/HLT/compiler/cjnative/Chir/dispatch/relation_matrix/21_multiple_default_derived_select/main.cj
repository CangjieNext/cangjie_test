/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 关系矩阵 21 | multiple_default_derived_select
 * 候选来源：菱形继承下多条默认实现路径；覆盖方向：派生层默认优先于上层默认。
 * 构造：接口 I 提供 foo 默认实现；接口 J <: I 覆盖 foo（更派生层的默认）；
 *       class C <: J 不实现 foo。泛型实例化到 C 时按需查询选取更派生层的 J.foo，
 *       而非上层 I.foo（菱形/多默认派生选取）。
 * 预期：trace=[J.foo]，-O0/-O2 一致；派生层默认优先。
 */
// Level: 1
// Description:
// 关系矩阵 21_multiple_default_derived_select | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package geninst_rm21

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

interface I {
    func foo(): Unit {
        __trace.append("[I.foo]")
    }
}

interface J <: I {
    func foo(): Unit {
        __trace.append("[J.foo]")
    }
}

class C <: J {
}

func k<T>(a: T): Unit where T <: I {
    a.foo()
}


@Test
class MultipleDefaultDerivedSelectTest {
    @TestCase
    func traceCheck(): Unit {

    k<C>(C())
        @Expect(__trace.toString(), "[J.foo]")
    }
}
