/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 六步⑤扩展自身实现覆盖扩展父接口默认·泛型函数触发 | 对应 design-spec §3 第⑤步 + §7 DFX case6
 * extend A <: I1 { func foo() } 自身实现覆盖 I2 默认(I2 经另一 extend 引入)。
 * 触发形态: 泛型函数 k<T>(a: T) where T <: I1。
 * 预期: 扩展自身实现覆盖扩展父接口默认,选取 extend A 版本,
 *       trace=[extend_A.foo],-O0/-O2 一致。
 */
// Level: 1
// Description:
// 六步种子(泛型函数版) 扩展自身覆盖父默认(泛型函数触发) | 泛型函数实例化按需选型正向,与同 case 非泛型函数版对齐。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package geninst_case6_g

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

interface I2 <: I1 {
    func foo(): Unit {
        __trace.append("[I2.foo]")
    }
}

class A {}

extend A <: I1 {
    public func foo(): Unit {
        __trace.append("[extend_A.foo]")
    }
}

extend A <: I2 {}

func k<T>(a: T): Unit where T <: I1 {
    a.foo()
}


@Test
class ExtendSelfCoversParentDefaultTest {
    @TestCase
    func traceCheck(): Unit {

    k<A>(A())
        @Expect(__trace.toString(), "[extend_A.foo]")
    }
}
