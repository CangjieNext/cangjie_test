/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * 关系矩阵 22 | default_plus_abstract_unique_select
 * 候选来源：一个默认实现 + 一个抽象声明；覆盖方向：唯一默认被选取（无歧义）。
 * 构造：接口 I1 提供 foo 默认实现；接口 I2 仅声明 foo 抽象（无默认）；
 *       class C <: I1 & I2 不实现 foo。同签名只有一个默认 → 选取 I1 的默认实现。
 * 预期：trace=[I1.f]，-O0/-O2 一致；唯一默认无歧义被选取。
 * 同 extend_resolution/DEFAULT_PLUS_ABSTRACT。
 */
// Level: 1
// Description:
// 关系矩阵 22_default_plus_abstract_unique_select | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package geninst_rm22

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

class C <: I1 & I2 {
}

func k<T>(a: T): Unit where T <: I1 {
    a.f()
}


@Test
class DefaultPlusAbstractUniqueSelectTest {
    @TestCase
    func traceCheck(): Unit {

    k<C>(C())
        @Expect(__trace.toString(), "[I1.f]")
    }
}
