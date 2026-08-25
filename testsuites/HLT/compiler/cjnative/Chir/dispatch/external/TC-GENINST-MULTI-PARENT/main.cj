/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * TC-GENINST-MULTI-PARENT | 无关默认冲突/显式消歧（正向侧）
 * 需求 design-spec §3(direct_unrelated_defaults)/§6；dt-design 异常用例3。
 *
 * 构造：接口 I1、I2（无父子关系）各带同名 foo 默认实现；class C <: I1 & I2
 * 提供显式实现 foo。泛型函数约束 T <: I1，实例化到 C 时按需查询命中本类型版本 C.foo，
 * 而非任一无关默认，且与声明顺序无关（对照同目录 conflict_part.cj 的无显式实现被拒绝）。
 */
// Level: 1
// Description:
// TC-GENINST-MULTI-PARENT | 无关默认冲突/显式消歧(正向侧),实例化命中本类型 C.foo 而非任一无关默认。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package packageA

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

interface I1 {
    func foo(): Int64 {
        __trace.append("[I1.foo]")
        1i64
    }
}

interface I2 {
    func foo(): Int64 {
        __trace.append("[I2.foo]")
        2i64
    }
}

class C <: I1 & I2 {
    public func foo(): Int64 {
        __trace.append("[C.foo]")
        3i64
    }
}

func g<T>(x: T): Int64 where T <: I1 {
    x.foo()
}


@Test
class GeninstMultiParentTest {
    @TestCase
    func traceCheck(): Unit {

    let direct = C().foo()
    let inst = g<C>(C())
        @Expect(direct, 3i64)
        @Expect(inst, 3i64)
        @Expect(__trace.toString(), "[C.foo][C.foo]")
    }
}
