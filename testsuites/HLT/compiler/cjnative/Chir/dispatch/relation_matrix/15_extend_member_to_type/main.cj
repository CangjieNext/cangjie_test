/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 关系矩阵 15 | extend_member_to_type
 * 候选来源：扩展自身定义的成员；覆盖方向：扩展成员 → 类型（类型无直接成员，沿用扩展成员）。
 * 构造：class A 无 foo；extend A 在扩展里定义 foo（不引入接口）。泛型函数约束 T <: A，
 *       实例化到 A 时调用 a.foo() 命中扩展定义的实现。
 * 预期：trace=[A.foo(ext)]，-O0/-O2 一致；证明扩展自身成员可被按需查询命中。
 * 注：此条不涉及接口约束，验证扩展成员的直接定位。
 */
// Level: 1
// Description:
// 关系矩阵 15_extend_member_to_type | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package geninst_rm15

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

class A {
}

extend A {
    public func foo(): Unit {
        __trace.append("[A.foo(ext)]")
    }
}

func k<T>(a: T): Unit where T <: A {
    a.foo()
}


@Test
class ExtendMemberToTypeTest {
    @TestCase
    func traceCheck(): Unit {

    k<A>(A())
        @Expect(__trace.toString(), "[A.foo(ext)]")
    }
}
