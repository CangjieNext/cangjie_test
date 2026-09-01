/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * default + abstract 唯一选取 | 对应 coverage GAP default_plus_abstract_unique_select
 * 规则(SPEC §6 规则8/9): 同签名候选中只有一个默认实现时类型可不实现使用默认;
 *       一个 default 加一个 abstract 时选唯一 default;若仍有歧义(多个 default)则拒绝。
 * 构造: I1 提供 foo 默认实现,I2 仅声明 foo 抽象(无默认),C <: I1 & I2 不实现 foo。
 *       同签名只有一个 default → 选取 I1 的默认实现。
 * 预期: trace=[I1.f],-O0/-O2 一致。
 */
// Level: 1
// Description:
// 扩展解析 DEFAULT_PLUS_ABSTRACT | extend 泛型成员合法匹配/默认+抽象唯一选取/跨方向 type-wins 正向。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package geninst_default_abstract

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

interface I1 {
    func f(): Unit {
        __trace.append("[I1.f]")
    }
}

interface I2 {
    func f(): Unit
}

class C <: I1 & I2 {}

func k<T>(a: T): Unit where T <: I1 {
    a.f()
}


@Test
class DefaultPlusAbstractTest {
    @TestCase
    func traceCheck(): Unit {

    k<C>(C())
        @Expect(__trace.toString(), "[I1.f]")
    }
}
