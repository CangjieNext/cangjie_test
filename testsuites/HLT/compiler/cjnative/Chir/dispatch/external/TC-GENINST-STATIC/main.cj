/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * TC-GENINST-STATIC | interface static 泛型正向侧
 * 需求 design-spec §3(static 成员定位规则)/§7:具体类型 static 实现被选中。
 * 这是 NEG_static_instance_clash 的正向侧：接口成员与类成员均为 static（状态一致），
 * 实例化调用命中具体类型的 static 实现。-O0/-O2 均成功链接运行，无 undefined symbol。
 *
 * 构造：泛型函数约束 T <: I，I 的 static 方法 foo 由具体类 A 以 static 实现。
 * 泛型函数 g<T> 内调用 T.foo()，经实例化后指向 A.foo 的 static 版本。
 */
// Level: 1
// Description:
// TC-GENINST-STATIC | 静态成员实例化选型,泛型函数约束 T <: I 实例化到 class 选取其 static 成员,输出 TRACE_OK。
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
    public static func foo(): Int64 {
        __trace.append("[I.foo]")
        1i64
    }
}

class A <: I {
    // 正向侧：类同名成员也是 static，状态一致，合法覆盖。
    public static func foo(): Int64 {
        __trace.append("[A.foo]")
        2i64
    }
}

// 泛型函数经实例化触发按需查询：T.foo() 解析到具体类型 A 的 static 实现。
func g<T>(a: T): Int64 where T <: I {
    T.foo()
}


@Test
class GeninstStaticTest {
    @TestCase
    func traceCheck(): Unit {

    // 直接 static 调用命中 A.foo。
    let direct = A.foo()
    // 泛型实例化调用同样命中 A.foo（按需查询重排选取具体类型 static）。
    let inst = g<A>(A())
        @Expect(direct, 2i64)
        @Expect(inst, 2i64)
        @Expect(__trace.toString(), "[A.foo][A.foo]")
    }
}
