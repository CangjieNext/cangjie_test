/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 跨方向合并 type-wins 独立 fixture | 对应 coverage GAP cross_direction_prefer_type
 * 规则(SPEC §6 规则10): 实现类型已存在(本类定义/父类继承)接口中同一函数的实现,
 *       则不再使用任何接口中的默认实现。扩展方向与类型方向交叉合并时,type/member 优先。
 * 构造: 类 A 自身已有 foo,扩展为 A 补接口 I1(I1 有 foo 默认实现)。
 *       类型自身实现优先于扩展引入的接口默认。
 *       交换声明顺序(extend 在前/类型 foo 在前)结果应一致(声明顺序无关)。
 * 预期: type-wins 选取 A.foo,trace=[A.foo],-O0/-O2 一致。
 */
// Level: 1
// Description:
// 扩展解析 CROSS_DIRECTION_TYPEWINS | extend 泛型成员合法匹配/默认+抽象唯一选取/跨方向 type-wins 正向。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package geninst_crossdir

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

extend A <: I1 {}

func k<T>(a: T): Unit where T <: I1 {
    a.foo()
}


@Test
class CrossDirectionTypewinsTest {
    @TestCase
    func traceCheck(): Unit {

    k<A>(A())
        @Expect(__trace.toString(), "[A.foo]")
    }
}
