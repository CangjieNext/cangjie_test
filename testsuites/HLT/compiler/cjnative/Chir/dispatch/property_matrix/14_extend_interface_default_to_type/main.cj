/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Level: 1
// Description:
// 关系矩阵 14 | extend_interface_default_to_type(属性):接口默认属性,扩展使 A 实现接口但 A 不提供属性。实例化到 A 选取接口默认 I.x。
// 正向单元测试:cjc --test 编译链接运行成功,PASSED:1 FAILED:0,-O0/-O2 一致。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args
// ASSERT: scan PASSED
// ASSERT: scan-not FAILED

package geninst_pm14

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

interface I {
    mut prop x: Int64 {
        get() {
            __trace.append("[I.x.get]")
            42
        }
        set(v) {
            __trace.append("[I.x.set]")
        }
    }
}
open class A {
}
extend A <: I {
}

func readX<T>(a: T): Int64 where T <: I {
    a.x
}

@Test
class Pm14ExtendInterfaceDefaultToType {
    @TestCase
    func traceCheck(): Unit {
        let c = A()
        let r = readX<A>(c)
        c.x = 99
        @Expect(__trace.toString(), "[I.x.get][I.x.set]")
        @Expect(r, 42)
    }
}
