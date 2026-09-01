/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Level: 1
// Description:
// 关系矩阵 21 | multiple_default_derived_select(属性):父子接口各带默认属性,子接口 J 覆盖父接口 I。实例化到 C 选取派生子接口 J.x 默认。
// 正向单元测试:cjc --test 编译链接运行成功,PASSED:1 FAILED:0,-O0/-O2 一致。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args
// ASSERT: scan PASSED
// ASSERT: scan-not FAILED

package geninst_pm21

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

interface I {
    mut prop x: Int64 {
        get() {
            __trace.append("[I.x.get]")
            0
        }
        set(v) {
            __trace.append("[I.x.set]")
        }
    }
}
interface J <: I {
    mut prop x: Int64 {
        get() {
            __trace.append("[J.x.get]")
            42
        }
        set(v) {
            __trace.append("[J.x.set]")
        }
    }
}
class C <: J {
}

func readX<T>(a: T): Int64 where T <: I {
    a.x
}

@Test
class Pm21MultipleDefaultDerivedSelect {
    @TestCase
    func traceCheck(): Unit {
        let c = C()
        let r = readX<C>(c)
        c.x = 99
        @Expect(__trace.toString(), "[J.x.get][J.x.set]")
        @Expect(r, 42)
    }
}
