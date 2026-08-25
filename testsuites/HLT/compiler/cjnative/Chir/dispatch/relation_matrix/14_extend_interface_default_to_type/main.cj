/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 关系矩阵 14 | extend_interface_default_to_type
 * 候选来源：扩展引入接口的默认实现；覆盖方向：扩展接口默认 → 类型（类型不覆盖，沿用默认）。
 * 构造：接口 I 提供 foo 默认实现；class A 无直接 foo；extend A <: I 引入接口（不在扩展里覆盖）。
 *       泛型实例化到 A 时按需查询选取扩展引入的接口默认 I.foo。
 * 预期：trace=[I.foo]，-O0/-O2 一致；证明扩展引入接口默认可被按需查询命中。
 */
// Level: 1
// Description:
// 关系矩阵 14_extend_interface_default_to_type | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package geninst_rm14

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

class A {
}

extend A <: I {
}

func k<T>(a: T): Unit where T <: I {
    a.foo()
}


@Test
class ExtendInterfaceDefaultToTypeTest {
    @TestCase
    func traceCheck(): Unit {

    k<A>(A())
        @Expect(__trace.toString(), "[I.foo]")
    }
}
