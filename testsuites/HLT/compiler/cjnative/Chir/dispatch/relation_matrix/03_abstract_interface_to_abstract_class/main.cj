/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 关系矩阵 03 | abstract_interface_to_abstract_class
 * 候选来源：抽象接口成员；覆盖方向：抽象接口 → 抽象 class（延迟到具体子类实现）。
 * 构造：接口 I 声明抽象 foo；abstract class AC <: I 不实现 foo（合法，因自身抽象）；
 *       具体子类 CC <: AC 实现 foo。泛型实例化到 CC 时按需查询穿透抽象层选取 CC.foo。
 * 预期：trace=[CC.foo]，-O0/-O2 一致；证明抽象中间层不阻断按需查询。
 */
// Level: 1
// Description:
// 关系矩阵 03_abstract_interface_to_abstract_class | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package geninst_rm03

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

interface I {
    func foo(): Unit
}

abstract class AC <: I {
}

class CC <: AC {
    public func foo(): Unit {
        __trace.append("[CC.foo]")
    }
}

func k<T>(a: T): Unit where T <: I {
    a.foo()
}


@Test
class AbstractInterfaceToAbstractClassTest {
    @TestCase
    func traceCheck(): Unit {

    k<CC>(CC())
        @Expect(__trace.toString(), "[CC.foo]")
    }
}
