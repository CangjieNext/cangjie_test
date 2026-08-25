/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * TC-GENINST-SEED | 六步①父接口默认 | 谓词 TC-GENINST-001
 * 需求 design-spec §7: 父接口默认实现,子接口覆盖,实例化选取子接口版本。
 * 手写落地(已验证 O0/O2 双跑 TRACE_OK)。
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

// Level: 1
// Description:
// 六步种子·父接口默认 | 泛型实例化按需选型正向。父接口默认/子覆盖/六步选取,实例化命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。

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

@Test
class ParentInterfaceDefaultTest {
    @TestCase
    func traceCheck(): Unit {
        let iface1: I2<Int64> = A()
        iface1.foo()
        @Expect(__trace.toString(), "[I2.foo]")
    }
}
