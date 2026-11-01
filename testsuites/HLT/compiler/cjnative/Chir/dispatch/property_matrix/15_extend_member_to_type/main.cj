/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Level: 1
// Description:
// 关系矩阵 15 | extend_member_to_type(属性):class A 无接口,扩展添加属性。实例化到 A 选取扩展属性(无接口约束)。
// 正向单元测试:cjc --test 编译链接运行成功,PASSED:1 FAILED:0,-O0/-O2 一致。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args
// ASSERT: scan PASSED
// ASSERT: scan-not FAILED

package geninst_pm15

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

class A {
    var _x: Int64 = 0
}
extend A {
    public mut prop x: Int64 {
        get() {
            __trace.append("[A.x(ext).get]")
            42
        }
        set(v) {
            __trace.append("[A.x(ext).set]")
        }
    }
}

func readX<T>(a: T): Int64 where T <: A {
    a.x
}

@Test
class Pm15ExtendMemberToType {
    @TestCase
    func traceCheck(): Unit {
        let c = A()
        let r = readX<A>(c)
        c.x = 99
        @Expect(__trace.toString(), "[A.x(ext).get][A.x(ext).set]")
        @Expect(r, 42)
    }
}
