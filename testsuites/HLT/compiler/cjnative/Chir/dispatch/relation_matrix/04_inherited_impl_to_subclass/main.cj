/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 关系矩阵 04 | inherited_impl_to_subclass
 * 候选来源：父类已实现的成员；覆盖方向：继承实现 → 子类（不覆盖，沿用父类）。
 * 构造：class P <: I 实现 foo；class S <: P 不覆盖 foo。泛型实例化到 S 时
 *       按需查询选取继承自父类的 P.foo。
 * 预期：trace=[P.foo]，-O0/-O2 一致；证明继承链上的实现可被按需查询命中。
 */
// Level: 1
// Description:
// 关系矩阵 04_inherited_impl_to_subclass | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package geninst_rm04

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

interface I {
    func foo(): Unit
}

open class P <: I {
    public func foo(): Unit {
        __trace.append("[P.foo]")
    }
}

class S <: P {
}

func k<T>(a: T): Unit where T <: I {
    a.foo()
}


@Test
class InheritedImplToSubclassTest {
    @TestCase
    func traceCheck(): Unit {

    k<S>(S())
        @Expect(__trace.toString(), "[P.foo]")
    }
}
