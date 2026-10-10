/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Level: 1
// Description:
// 关系矩阵 05 | abstract_parent_to_concrete_subclass(属性):抽象类声明属性,具体子类 B override。实例化到 B 选取 B.x。
// 正向单元测试:cjc --test 编译链接运行成功,PASSED:1 FAILED:0,-O0/-O2 一致。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args
// ASSERT: scan PASSED
// ASSERT: scan-not FAILED

package geninst_pm05

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

abstract class A {
    public open mut prop x: Int64 {
        get() {
            0
        }
        set(v) {
        }
    }
}
class B <: A {
    var _x: Int64 = 0
    public override mut prop x: Int64 {
        get() {
            __trace.append("[B.x.get]")
            42
        }
        set(v) {
            __trace.append("[B.x.set]")
        }
    }
}

func readX<T>(a: T): Int64 where T <: A {
    a.x
}

@Test
class Pm05AbstractParentToConcreteSubclass {
    @TestCase
    func traceCheck(): Unit {
        let c = B()
        let r = readX<B>(c)
        c.x = 99
        @Expect(__trace.toString(), "[B.x.get][B.x.set]")
        @Expect(r, 42)
    }
}
