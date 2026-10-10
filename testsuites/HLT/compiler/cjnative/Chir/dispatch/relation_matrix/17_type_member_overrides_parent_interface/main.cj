/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 关系矩阵 17 | type_member_overrides_parent_interface
 * 候选来源：类型自身成员 vs 扩展引入接口默认；覆盖方向：类型自身优先于扩展引入的接口默认。
 * 构造：class A 自身已有 foo；接口 I 提供 foo 默认实现；extend A <: I 引入接口（不在扩展覆盖）。
 *       泛型实例化到 A 时按需查询优先选取类型自身 A.foo，而非扩展引入的接口默认 I.foo。
 * 预期：trace=[A.foo]，-O0/-O2 一致；交换 extend 在前/类型 foo 在前结果不变（声明顺序无关）。
 * 同 extend_resolution/CROSS_DIRECTION_TYPEWINS。
 */
// Level: 1
// Description:
// 关系矩阵 17_type_member_overrides_parent_interface | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package geninst_rm17

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
    public func foo(): Unit {
        __trace.append("[A.foo]")
    }
}

extend A <: I {
}

func k<T>(a: T): Unit where T <: I {
    a.foo()
}


@Test
class TypeMemberOverridesParentInterfaceTest {
    @TestCase
    func traceCheck(): Unit {

    k<A>(A())
        @Expect(__trace.toString(), "[A.foo]")
    }
}
