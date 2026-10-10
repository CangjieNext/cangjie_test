/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Level: 1
// Description:
// 关系矩阵 22 | default_plus_abstract_unique_select(属性):I1 默认属性 + I2 抽象属性(无默认),C 不实现。实例化到 C 唯一选取 I1 默认。
// 正向单元测试:cjc --test 编译链接运行成功,PASSED:1 FAILED:0,-O0/-O2 一致。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args
// ASSERT: scan PASSED
// ASSERT: scan-not FAILED

package geninst_pm22

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

interface I1 {
    mut prop x: Int64 {
        get() {
            __trace.append("[I1.x.get]")
            42
        }
        set(v) {
            __trace.append("[I1.x.set]")
        }
    }
}
interface I2 {
    mut prop x: Int64
}
class C <: I1 & I2 {
}

func readX<T>(a: T): Int64 where T <: I1 {
    a.x
}

@Test
class Pm22DefaultPlusAbstractUniqueSelect {
    @TestCase
    func traceCheck(): Unit {
        let c = C()
        let r = readX<C>(c)
        c.x = 99
        @Expect(__trace.toString(), "[I1.x.get][I1.x.set]")
        @Expect(r, 42)
    }
}
