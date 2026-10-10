/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 六步⑤扩展自身覆盖+⑥并入 type-wins·泛型函数触发 | 对应 design-spec §3 第⑤⑥步 + §7 DFX case5
 * 父类 A1 已有 foo,扩展为 A2 补 I1/I2 接口。
 * 触发形态: 泛型函数 k<T>(a: T) where T <: I1。
 * 预期: ⑥步并入时本类型(经父类继承)已有同名 A1.foo → 放弃扩展 I2 默认,
 *       type-wins 选取父类 A1.foo,trace=[A1.foo],-O0/-O2 一致。
 */
// Level: 1
// Description:
// 六步种子(泛型函数版) 扩展自身(泛型函数触发) | 泛型函数实例化按需选型正向,与同 case 非泛型函数版对齐。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package geninst_case5_g

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

open class A1 {
    public open func foo(): Unit {
        __trace.append("[A1.foo]")
    }
}

class A2 <: A1 {}

extend A2 <: I1 {}

extend A2 <: I2 {}

func k<T>(a: T): Unit where T <: I1 {
    a.foo()
}


@Test
class ExtendSelfOverrideTypewinsTest {
    @TestCase
    func traceCheck(): Unit {

    k<A2>(A2())
        @Expect(__trace.toString(), "[A1.foo]")
    }
}
