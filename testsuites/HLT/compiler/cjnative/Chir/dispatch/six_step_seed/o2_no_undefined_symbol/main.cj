/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * TC-GENINST-843-O2 | issue#843 -O2 无 undefined symbol
 * 需求 design-spec §1: -O2 抽象方法实例化为 undefined symbol 链接错误修复点
 *   (GetInstantiatedTarget 空回退 instDecl ? instDecl : decl)。
 * 构造: 跨接口继承 I<:I_Buddy + extend C<:I + 泛型函数 test<M> where M<:I_Buddy。
 * 手写落地(已验证 -O2 TRACE_OK,0 undefined symbol)。
 */
// Level: 1
// Description:
// 六步种子 GENINST_issue843 | 泛型实例化按需选型正向。父接口默认/子覆盖/六步选取,实例化命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package packageA

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

interface I_Buddy {
    func foo_Buddy(): Int64

    func boo_Buddy(): Int64
}

interface I <: I_Buddy {
    func foo_Buddy(): Int64 {
        __trace.append("[I.foo_Buddy]")
        1i64
    }

    func boo_Buddy(): Int64 {
        __trace.append("[I.boo_Buddy]")
        1i64
    }
}

class C {}

extend C <: I {
    public func foo_Buddy(): Int64 {
        __trace.append("[extend_C_I.foo_Buddy]")
        1i64
    }
    public func boo_Buddy(): Int64 {
        __trace.append("[extend_C_I.boo_Buddy]")
        1i64
    }
}

func testBuddy<M>(m: M): Unit where M <: I_Buddy {
    m.foo_Buddy()
    m.boo_Buddy()
}


@Test
class O2NoUndefinedSymbolTest {
    @TestCase
    func traceCheck(): Unit {

    let obj0: C = C()
    testBuddy<C>(C())
    let ext0: I = C()
    ext0.foo_Buddy()
    ext0.boo_Buddy()
        @Expect(__trace.toString(), "[extend_C_I.foo_Buddy][extend_C_I.boo_Buddy][extend_C_I.foo_Buddy][extend_C_I.boo_Buddy]")
    }
}
