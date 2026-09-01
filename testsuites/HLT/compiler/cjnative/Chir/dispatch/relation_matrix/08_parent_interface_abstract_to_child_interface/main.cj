/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 关系矩阵 08 | parent_interface_abstract_to_child_interface
 * 候选来源：父接口声明抽象成员；覆盖方向：父接口抽象 → 子接口（子接口可声明但未实现）。
 * 构造：接口 I 声明抽象 foo；子接口 J <: I 重新声明 foo（仍抽象）；class C <: J 实现 foo。
 *       泛型实例化到 C 时按需查询穿透两层接口选取 C.foo。
 * 预期：trace=[C.foo]，-O0/-O2 一致；证明子接口重新声明不阻断按需查询。
 */
// Level: 1
// Description:
// 关系矩阵 08_parent_interface_abstract_to_child_interface | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package geninst_rm08

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

interface I {
    func foo(): Unit
}

interface J <: I {
    func foo(): Unit
}

class C <: J {
    public func foo(): Unit {
        __trace.append("[C.foo]")
    }
}

func k<T>(a: T): Unit where T <: I {
    a.foo()
}


@Test
class ParentInterfaceAbstractToChildInterfaceTest {
    @TestCase
    func traceCheck(): Unit {

    k<C>(C())
        @Expect(__trace.toString(), "[C.foo]")
    }
}
