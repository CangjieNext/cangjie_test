/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * TC-GENINST-PROPERTY | property getter/setter 重排
 * 需求 design-spec §7 DFX(property 重排)：接口属性经 WorkForMembers 重排后，
 * 读与写均指向实例化类的对应版本。getter/setter 同时重写，O0 与 O2 行为一致。
 *
 * 构造：接口 I 声明 mut prop x（带 getter/setter 默认实现）；class C <: I
 * 同时重写 getter 与 setter。泛型函数 g<T> 约束 T <: I，实例化到 C 时
 * 读 x 走 C.x.get、写 x 走 C.x.set（按需查询重排指向实例化类对应版本）。
 */
// Level: 1
// Description:
// TC-GENINST-PROPERTY | getter/setter 全重写正向,实例化命中本类型 getter+setter,trace=[C.x.get][C.x.set],输出 TRACE_OK。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package packageA

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

interface I {
    mut prop x: Int64 {
        get() { __trace.append("[I.x.get]"); 0 }
        set(v) { __trace.append("[I.x.set]") }
    }
}

class C <: I {
    var _x: Int64 = 0
    public mut prop x: Int64 {
        get() { __trace.append("[C.x.get]"); 42 }
        set(v) { __trace.append("[C.x.set]") }
    }
}

func g<T>(c: T): Unit where T <: I {
    let r = c.x
}


@Test
class GeninstPropertyTest {
    @TestCase
    func traceCheck(): Unit {

    var c = C()
    g<C>(c)
    c.x = 99
        @Expect(__trace.toString(), "[C.x.get][C.x.set]")
    }
}
