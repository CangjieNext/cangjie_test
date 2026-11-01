/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 关系矩阵 11 | parent_class_to_interface
 * 候选来源：父类已实现成员；覆盖方向：父类实现 → 接口（接口要求同名成员，父类实现满足）。
 * 构造：class P 实现 foo；接口 I 声明抽象 foo；class S <: P & I 沿用父类 foo 满足接口。
 *       泛型约束 T <: I，实例化到 S 时按需查询选取继承自父类的 P.foo 满足接口要求。
 * 预期：trace=[P.foo]，-O0/-O2 一致；证明父类实现可满足子类接口要求。
 */
// Level: 1
// Description:
// 关系矩阵 11_parent_class_to_interface | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package geninst_rm11

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

open class P {
    public open func foo(): Unit {
        __trace.append("[P.foo]")
    }
}

interface I {
    func foo(): Unit
}

class S <: P & I {
}

func k<T>(a: T): Unit where T <: I {
    a.foo()
}


@Test
class ParentClassToInterfaceTest {
    @TestCase
    func traceCheck(): Unit {

    k<S>(S())
        @Expect(__trace.toString(), "[P.foo]")
    }
}
