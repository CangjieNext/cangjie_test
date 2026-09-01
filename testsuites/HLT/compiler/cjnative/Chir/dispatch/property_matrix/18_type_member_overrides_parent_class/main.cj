/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Level: 1
// Description:
// 关系矩阵 18 | type_member_overrides_parent_class(属性):父类 open 属性,子类 override。实例化到 S 选取 S.x 而非父类。
// 正向单元测试:cjc --test 编译链接运行成功,PASSED:1 FAILED:0,-O0/-O2 一致。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args
// ASSERT: scan PASSED
// ASSERT: scan-not FAILED

package geninst_pm18

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

open class P {
    var _x: Int64 = 0
    public open mut prop x: Int64 {
        get() {
            __trace.append("[P.x.get]")
            1
        }
        set(v) {
            __trace.append("[P.x.set]")
        }
    }
}
class S <: P {
    var _y: Int64 = 0
    public override mut prop x: Int64 {
        get() {
            __trace.append("[S.x.get]")
            42
        }
        set(v) {
            __trace.append("[S.x.set]")
        }
    }
}

func readX<T>(a: T): Int64 where T <: P {
    a.x
}

@Test
class Pm18TypeMemberOverridesParentClass {
    @TestCase
    func traceCheck(): Unit {
        let c = S()
        let r = readX<S>(c)
        c.x = 99
        @Expect(__trace.toString(), "[S.x.get][S.x.set]")
        @Expect(r, 42)
    }
}
