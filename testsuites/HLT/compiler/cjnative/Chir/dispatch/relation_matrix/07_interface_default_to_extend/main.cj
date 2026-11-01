/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 关系矩阵 07 | interface_default_to_extend
 * 候选来源：接口默认实现；覆盖方向：接口默认 → extend（扩展覆盖默认）。
 * 构造：接口 I 提供 foo 默认实现；struct S <: I 无直接 foo；extend S 覆盖 foo。
 *       泛型实例化到 S 时按需查询优先选取扩展覆盖的 S.foo，而非接口默认 I.foo。
 * 预期：trace=[S.foo(ext)]，-O0/-O2 一致；声明顺序无关。
 */
// Level: 1
// Description:
// 关系矩阵 07_interface_default_to_extend | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package geninst_rm07

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

interface I {
    func foo(): Unit {
        __trace.append("[I.foo]")
    }
}

struct S {
    public let v: Int64
    public init(v: Int64) { this.v = v }
}

extend S <: I {
    public func foo(): Unit {
        __trace.append("[S.foo(ext)]")
    }
}

func k<T>(a: T): Unit where T <: I {
    a.foo()
}


@Test
class InterfaceDefaultToExtendTest {
    @TestCase
    func traceCheck(): Unit {

    k<S>(S(0i64))
        @Expect(__trace.toString(), "[S.foo(ext)]")
    }
}
