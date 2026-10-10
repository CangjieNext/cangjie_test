/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * TC-GENINST-SEED | DFX case1g | 六步①父接口(泛型函数触发) | 谓词 TC-GENINST-001
 * 需求 design-spec §7: 经泛型函数 k<T0> 触发实例化,验证指针重排真实形态。
 * 手写落地(已验证 O2 TRACE_OK)。
 */
// Level: 1
// Description:
// 六步种子 父接口默认(泛型函数触发) | 泛型实例化按需选型正向。父接口默认/子覆盖/六步选取,实例化命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package packageA

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

interface I1<T0> {
    func foo(): Int64 {
        __trace.append("[I1.foo]")
        1i64
    }
}

interface I2<T0> <: I1<Int64> {
    func foo(): Int64 {
        __trace.append("[I2.foo]")
        1i64
    }
}

class A <: I2<Int64> {}

func k<T0>(a: T0): Unit where T0 <: I2<Int64> {
    a.foo()
}


@Test
class ParentInterfaceDefaultGenfuncTest {
    @TestCase
    func traceCheck(): Unit {

    let obj0: A = A()
    let iface1: I2<Int64> = A()
    iface1.foo()
    k<A>(A())
        @Expect(__trace.toString(), "[I2.foo][I2.foo]")
    }
}
