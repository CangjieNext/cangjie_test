/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * generic 成员合法匹配正向 | 对应 NEG_generic_mismatch 正向侧 + dt-design 异常用例6正向
 * 规则(SPEC §6 实现规则5 + §9): 接口泛型成员与满足约束的泛型 class 成员,
 *       generic 状态一致时 GenerateGenericMappingFromGeneric 代入后 IsFuncTySubType 判定成立。
 * 构造: 接口 I<T0> 泛型成员 foo(): T0,class C <: I<Int64> 提供 foo(): Int64。
 *       两者"泛型一致",合法匹配,不触发 NEG_generic_mismatch 的 noRelation。
 * 预期: 泛型函数 k<C> 触发按需查询,选中 C.foo,trace=[C.foo],-O0/-O2 一致。
 */
// Level: 1
// Description:
// 扩展解析 GENMEMBER_positive | extend 泛型成员合法匹配/默认+抽象唯一选取/跨方向 type-wins 正向。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package geninst_genmember

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

interface I<T0> {
    func foo(): T0
}

class C <: I<Int64> {
    public func foo(): Int64 {
        __trace.append("[C.foo]")
        1
    }
}

func k<T>(a: T): Unit where T <: I<Int64> {
    a.foo()
}


@Test
class GenmemberPositiveTest {
    @TestCase
    func traceCheck(): Unit {

    k<C>(C())
        @Expect(__trace.toString(), "[C.foo]")
    }
}
