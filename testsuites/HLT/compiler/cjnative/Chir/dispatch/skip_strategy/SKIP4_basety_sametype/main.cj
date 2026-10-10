/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 跳过策略4: baseTy 找到的被覆盖函数与语义 target 在同类型 → 使用语义结果 | design-spec §3 跳过策略第4条
 * 规则: 通过 baseTy 找到的被覆盖函数与语义提供的 target 在同类型中
 *       → 使用语义结果,不二次重排。
 * 构造: 父类 A1 有 open foo,子类 A2 <: A1 & I1 override foo。
 *       经泛型函数 k<A2> 触发,baseTy=A2 找到 A2 的 override 版本,与语义 target 同类型 → 跳过4。
 * 预期: 使用语义结果调 A2.foo,trace=[A2.foo],-O0/-O2 一致。
 */
// Level: 1
// Description:
// 跳过策略 SKIP4_basety_sametype | 按需查询的跳过分支(非成员/接口非静态/类自身/基类型同类型),不实例化仍正确。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package geninst_skip4

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

open class A1 {
    public open func foo(): Unit {
        __trace.append("[A1.foo]")
    }
}

class A2 <: A1 & I1 {
    public override func foo(): Unit {
        __trace.append("[A2.foo]")
    }
}

func k<T>(a: T): Unit where T <: I1 {
    a.foo()
}


@Test
class BasetySametypeTest {
    @TestCase
    func traceCheck(): Unit {

    k<A2>(A2())
        @Expect(__trace.toString(), "[A2.foo]")
    }
}
