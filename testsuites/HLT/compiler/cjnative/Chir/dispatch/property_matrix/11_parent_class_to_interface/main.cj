/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Level: 1
// Description:
// 关系矩阵 11 | parent_class_to_interface(属性):父类已有属性,子类 S 实现接口(继承父类属性)。实例化到 S 经接口查询选取继承的 P.x。
// 正向单元测试:cjc --test 编译链接运行成功,PASSED:1 FAILED:0,-O0/-O2 一致。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args
// ASSERT: scan PASSED
// ASSERT: scan-not FAILED

package geninst_pm11

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

open class P {
    var _x: Int64 = 0
    public mut prop x: Int64 {
        get() {
            __trace.append("[P.x.get]")
            42
        }
        set(v) {
            __trace.append("[P.x.set]")
        }
    }
}
interface I {
    mut prop x: Int64 {
        get() {
            0
        }
        set(v) {
        }
    }
}
class S <: P & I {
}

func readX<T>(a: T): Int64 where T <: I {
    a.x
}

@Test
class Pm11ParentClassToInterface {
    @TestCase
    func traceCheck(): Unit {
        let c = S()
        let r = readX<S>(c)
        c.x = 99
        @Expect(__trace.toString(), "[P.x.get][P.x.set]")
        @Expect(r, 42)
    }
}
