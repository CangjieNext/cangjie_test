/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 关系矩阵 24 | cross_direction_prefer_type
 * 候选来源：扩展方向引入接口默认 vs 类型方向自身实现；覆盖方向：交叉合并时类型自身优先。
 * 构造：class A 自身已有 foo；接口 I1 提供 foo 默认实现；extend A <: I1 引入接口。
 *       扩展方向（接口默认）与类型方向（自身实现）交叉合并时，类型自身实现优先。
 * 预期：trace=[A.foo]，-O0/-O2 一致；交换声明顺序结果不变。
 * 同 extend_resolution/CROSS_DIRECTION_TYPEWINS。
 */
// Level: 1
// Description:
// 关系矩阵 24_cross_direction_prefer_type | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package geninst_rm24

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

interface I1 {
    func foo(): Unit {
        __trace.append("[I1.foo]")
    }
}

class A {
    public func foo(): Unit {
        __trace.append("[A.foo]")
    }
}

extend A <: I1 {
}

func k<T>(a: T): Unit where T <: I1 {
    a.foo()
}


@Test
class CrossDirectionPreferTypeTest {
    @TestCase
    func traceCheck(): Unit {

    k<A>(A())
        @Expect(__trace.toString(), "[A.foo]")
    }
}
