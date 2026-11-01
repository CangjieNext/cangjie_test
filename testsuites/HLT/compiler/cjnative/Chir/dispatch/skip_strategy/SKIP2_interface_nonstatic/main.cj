/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 跳过策略2: 通过接口访问的非静态成员忽略 vs static 不跳过 | 对应 design-spec §3 跳过策略第2条
 * 规则: ty.IsInterface() && !fd.TestAttr(STATIC) → 返回原 fd 不重排(由运行时决定)。
 *      static 方法不跳过,需重排到具体类型 static 实现。
 * 构造: 接口 I1 同时有非静态默认 ins(运行时决定)与静态默认 sta。
 *       类 C 覆盖两者。经泛型函数 k<C> 调用 a.ins()(非静态,运行时),直接 I1.sta() 调用静态。
 * 预期: trace=[C.ins][I1.sta],-O0/-O2 一致。
 */
// Level: 1
// Description:
// 跳过策略 SKIP2_interface_nonstatic | 按需查询的跳过分支(非成员/接口非静态/类自身/基类型同类型),不实例化仍正确。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package geninst_skip2

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

interface I1 {
    func ins(): Unit {
        __trace.append("[I1.ins]")
    }
    static func sta(): Unit {
        __trace.append("[I1.sta]")
    }
}

class C <: I1 {
    public func ins(): Unit {
        __trace.append("[C.ins]")
    }
    public static func sta(): Unit {
        __trace.append("[C.sta]")
    }
}

func k<T>(a: T): Unit where T <: I1 {
    a.ins()
}


@Test
class InterfaceNonstaticTest {
    @TestCase
    func traceCheck(): Unit {

    k<C>(C())
    I1.sta()
        @Expect(__trace.toString(), "[C.ins][I1.sta]")
    }
}
