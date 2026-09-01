/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Level: 1
// Description:
// 关系矩阵 24 | cross_direction_prefer_type(属性):类型自身属性与接口默认交叉。实例化到 A 优先类型自身 A.x 而非接口默认。
// 正向单元测试:cjc --test 编译链接运行成功,PASSED:1 FAILED:0,-O0/-O2 一致。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args
// ASSERT: scan PASSED
// ASSERT: scan-not FAILED

package geninst_pm24

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

interface I1 {
    mut prop x: Int64 {
        get() {
            __trace.append("[I1.x.get]")
            0
        }
        set(v) {
            __trace.append("[I1.x.set]")
        }
    }
}
open class A {
    var _x: Int64 = 0
    public mut prop x: Int64 {
        get() {
            __trace.append("[A.x.get]")
            42
        }
        set(v) {
            __trace.append("[A.x.set]")
        }
    }
}
extend A <: I1 {
}

func readX<T>(a: T): Int64 where T <: I1 {
    a.x
}

@Test
class Pm24CrossDirectionPreferType {
    @TestCase
    func traceCheck(): Unit {
        let c = A()
        let r = readX<A>(c)
        c.x = 99
        @Expect(__trace.toString(), "[A.x.get][A.x.set]")
        @Expect(r, 42)
    }
}
