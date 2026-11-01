/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 关系矩阵 01 | interface_abstract_to_class
 * 候选来源：接口声明抽象成员；覆盖方向：接口 → class（class 提供实现）。
 * 构造：接口 I 声明抽象 foo，class C <: I 实现 foo。泛型函数约束 T <: I，
 *       实例化到 C 时按需查询选取 C.foo（类型自身实现覆盖接口抽象）。
 * 预期：trace=[C.foo]，-O0/-O2 一致；交换 I/C 声明顺序结果不变。
 */
// Level: 1
// Description:
// 关系矩阵 01_interface_abstract_to_class | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package geninst_rm01

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

interface I {
    func foo(): Unit
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
class InterfaceAbstractToClassTest {
    @TestCase
    func traceCheck(): Unit {

    k<C>(C())
        @Expect(__trace.toString(), "[C.foo]")
    }
}
