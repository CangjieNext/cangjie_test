/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Level: 1
// Description:
// 关系矩阵 03 | abstract_interface_to_abstract_class(属性):接口默认属性,抽象类延迟实现,具体子类 CC 实现。实例化到 CC 选取 CC.x。
// 正向单元测试:cjc --test 编译链接运行成功,PASSED:1 FAILED:0,-O0/-O2 一致。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args
// ASSERT: scan PASSED
// ASSERT: scan-not FAILED

package geninst_pm03

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

interface I {
    mut prop x: Int64 {
        get() {
            0
        }
        set(v) {
        }
    }
}
abstract class AC <: I {
}
class CC <: AC {
    var _x: Int64 = 0
    public mut prop x: Int64 {
        get() {
            __trace.append("[CC.x.get]")
            42
        }
        set(v) {
            __trace.append("[CC.x.set]")
        }
    }
}

func readX<T>(a: T): Int64 where T <: I {
    a.x
}

@Test
class Pm03AbstractInterfaceToAbstractClass {
    @TestCase
    func traceCheck(): Unit {
        let c = CC()
        let r = readX<CC>(c)
        c.x = 99
        @Expect(__trace.toString(), "[CC.x.get][CC.x.set]")
        @Expect(r, 42)
    }
}
