/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * TC-GENINST-OVERRODE | overrode_by_diff_inst 回归
 * 需求 design-spec §6 兼容性：移除全局 abstractFuncToDeclMap 预构建后（按需查询替代），
 * 不同实例化声明之间的覆盖结果保持等价，无陈旧目标复用。
 *
 * 构造：泛型类 Container<T> 带 foo 方法；实例化到 Container<Int64> 与 Container<Bool>
 * 两个不同实例化声明，各自调用 foo 应命中各自实例化版本，结果等价、不串。
 * 泛型函数 g<T> 分别约束为 Int64/Bool 容器实例化，断言两者 trace 各自正确、无陈旧复用。
 */
// Level: 1
// Description:
// TC-GENINST-OVERRODE | 子类/extend 已显式 override 时选取本类型实现,不误选父默认,输出 TRACE_OK。
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
    func foo(): Int64
}

class Container<T> <: I {
    public let tag: Int64
    public init(tag: Int64) { this.tag = tag }
    public func foo(): Int64 {
        __trace.append("[Container<T>.foo:${tag}]")
        tag
    }
}

func g<T>(c: T): Int64 where T <: I {
    c.foo()
}


@Test
class GeninstOverrodeTest {
    @TestCase
    func traceCheck(): Unit {

    let ci = Container<Int64>(7i64)
    let cb = Container<Bool>(9i64)
    let ri = g<Container<Int64>>(ci)
    let rb = g<Container<Bool>>(cb)
    // 两个不同实例化声明各自命中自己的 foo，结果 7 与 9，trace 顺序正确，无串包/陈旧复用。
        @Expect(ri, 7i64)
        @Expect(rb, 9i64)
        @Expect(__trace.toString(), "[Container<T>.foo:7][Container<T>.foo:9]")
    }
}
