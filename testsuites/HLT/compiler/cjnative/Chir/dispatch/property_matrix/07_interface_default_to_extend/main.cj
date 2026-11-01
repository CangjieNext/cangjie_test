/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Level: 1
// Description:
// 关系矩阵 07 | interface_default_to_extend(属性):接口默认属性,扩展覆盖。实例化到 S 选取扩展覆盖 S.x 而非接口默认。
// 正向单元测试:cjc --test 编译链接运行成功,PASSED:1 FAILED:0,-O0/-O2 一致。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args
// ASSERT: scan PASSED
// ASSERT: scan-not FAILED

package geninst_pm07

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
struct S {
    public var _x: Int64
    public init(v: Int64) {
        _x = v
    }
}
extend S <: I {
    public mut prop x: Int64 {
        get() {
            __trace.append("[S.x(ext).get]")
            42
        }
        set(v) {
            __trace.append("[S.x(ext).set]")
        }
    }
}

func readX<T>(a: T): Int64 where T <: I {
    a.x
}

@Test
class Pm07InterfaceDefaultToExtend {
    @TestCase
    func traceCheck(): Unit {
        var c = S(0i64)
        let r = readX<S>(c)
        c.x = 99
        @Expect(__trace.toString(), "[S.x(ext).get][S.x(ext).set]")
        @Expect(r, 42)
    }
}
