/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 关系矩阵 19 | class_overrides_interface_default
 * 候选来源：接口默认实现 vs 类型自身成员；覆盖方向：类型自身覆盖接口默认。
 * 构造：接口 I 提供 foo 默认实现；class C <: I 自身覆盖 foo。泛型实例化到 C 时
 *       按需查询优先选取类型自身 C.foo，而非接口默认 I.foo。
 * 预期：trace=[C.foo]，-O0/-O2 一致；类型自身优先于接口默认。
 */
// Level: 1
// Description:
// 关系矩阵 19_class_overrides_interface_default | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package geninst_rm19

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

class C <: I {
    public func foo(): Unit {
        __trace.append("[C.foo]")
    }
}

func k<T>(a: T): Unit where T <: I {
    a.foo()
}


@Test
class ClassOverridesInterfaceDefaultTest {
    @TestCase
    func traceCheck(): Unit {

    k<C>(C())
        @Expect(__trace.toString(), "[C.foo]")
    }
}
