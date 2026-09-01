/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Level: 1
// Description:
// 关系矩阵 25 | getter_setter_independent(属性):接口只读 prop(仅 getter),class 实现只读 prop。实例化只读,验证 getter 独立解析选取 C.x.get。对照 mut prop 双访问器用例。
// 正向单元测试:cjc --test 编译链接运行成功,PASSED:1 FAILED:0,-O0/-O2 一致。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args
// ASSERT: scan PASSED
// ASSERT: scan-not FAILED

package geninst_pm25

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

interface I {
    prop x: Int64 {
        get() {
            0
        }
    }
}
class C <: I {
    var _x: Int64 = 0
    public prop x: Int64 {
        get() {
            __trace.append("[C.x.get]")
            42
        }
    }
}

func readX<T>(a: T): Int64 where T <: I {
    a.x
}

@Test
class Pm25GetterSetterIndependent {
    @TestCase
    func traceCheck(): Unit {
        let c = C()
        let r = readX<C>(c)
        @Expect(__trace.toString(), "[C.x.get]")
        @Expect(r, 42)
    }
}
