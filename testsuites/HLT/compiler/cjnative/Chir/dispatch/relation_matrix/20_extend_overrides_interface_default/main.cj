/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 关系矩阵 20 | extend_overrides_interface_default
 * 候选来源：接口默认实现 vs 扩展自身成员；覆盖方向：扩展覆盖接口默认。
 * 构造：接口 I 提供 foo 默认实现；class A <: I 无直接 foo；extend A 在扩展里覆盖 foo。
 *       泛型实例化到 A 时按需查询优先选取扩展覆盖的 A.foo(ext)，而非接口默认 I.foo。
 * 预期：trace=[A.foo(ext)]，-O0/-O2 一致；扩展优先于接口默认。
 */
// Level: 1
// Description:
// 关系矩阵 20_extend_overrides_interface_default | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package geninst_rm20

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
    public func foo(): Unit {
        __trace.append("[A.foo(ext)]")
    }
}

func k<T>(a: T): Unit where T <: I {
    a.foo()
}


@Test
class ExtendOverridesInterfaceDefaultTest {
    @TestCase
    func traceCheck(): Unit {

    k<A>(A())
        @Expect(__trace.toString(), "[A.foo(ext)]")
    }
}
