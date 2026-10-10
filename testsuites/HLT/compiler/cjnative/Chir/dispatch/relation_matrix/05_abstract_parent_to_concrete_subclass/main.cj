/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 关系矩阵 05 | abstract_parent_to_concrete_subclass
 * 候选来源：抽象父类声明的抽象方法；覆盖方向：抽象父类 → 具体子类（实现）。
 * 构造：abstract class A 声明抽象 foo；class B <: A 实现 foo。泛型上界 T <: A，
 *       实例化到 B 时按需查询穿透抽象父类选取 B.foo。
 * 预期：trace=[B.foo]，-O0/-O2 一致；不完整子类（不实现 foo）被拒绝（见 negative_part.cj）。
 */
// Level: 1
// Description:
// 关系矩阵 05_abstract_parent_to_concrete_subclass | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package geninst_rm05

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

abstract class A {
    public func foo(): Unit
}

class B <: A {
    public override func foo(): Unit {
        __trace.append("[B.foo]")
    }
}

func k<T>(a: T): Unit where T <: A {
    a.foo()
}


@Test
class AbstractParentToConcreteSubclassTest {
    @TestCase
    func traceCheck(): Unit {

    k<B>(B())
        @Expect(__trace.toString(), "[B.foo]")
    }
}
