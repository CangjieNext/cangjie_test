/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * TC-GENINST-SEED | DFX case4 | 六步④扩展父接口默认 + ⑥type-wins | 谓词 TC-GENINST-004/006
 * 需求 design-spec §7: 两个扩展各实现父子接口,子接口默认 type-wins 选取 I2。
 * 手写落地(已验证 O0/O2 TRACE_OK)。
 */
// Level: 1
// Description:
// 六步种子 扩展父接口默认 | 泛型实例化按需选型正向。父接口默认/子覆盖/六步选取,实例化命中预期版本。
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

class A {}

extend A <: I1<Int64> {}

extend A <: I2<Int64> {}


@Test
class ExtendParentIfaceDefaultTest {
    @TestCase
    func traceCheck(): Unit {

    let obj0: A = A()
    let ext0: I1<Int64> = A()
    ext0.foo()
    let ext1: I2<Int64> = A()
    ext1.foo()
        @Expect(__trace.toString(), "[I2.foo][I2.foo]")
    }
}
