/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * TC-GENINST-O0-NATIVE | O0 原生按需实例化
 * 需求 design-spec §6 兼容性：O0 不开启泛型实例化，但 primitive 等必要实例化路径
 * 仍按需查询重排（非全量预构建）。O0 与 O2 选取实现目标等价、可观察行为一致。
 *
 * 构造：接口 I 声明 foo；struct IntWrap（承载 primitive Int64）与 struct BoolWrap（承载 Bool）
 * 各自实现 I.foo。泛型函数 g<T> 约束 T <: I，实例化到 IntWrap/BoolWrap 时
 * 分别按需查询选取各自的实现。-O0/-O2 双跑断言 trace 一致。
 * 说明：本用例用 primitive 承载类型验证按需实例化在 O0 下仍正确分派。
 */
// Level: 1
// Description:
// TC-GENINST-O0-NATIVE | O0 native 实例化选取与 native 编译路径验证,输出 TRACE_OK。
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

struct IntWrap <: I {
    public let v: Int64
    public init(v: Int64) { this.v = v }
    public func foo(): Int64 {
        __trace.append("[IntWrap.foo]")
        1i64
    }
}

struct BoolWrap <: I {
    public let v: Bool
    public init(v: Bool) { this.v = v }
    public func foo(): Int64 {
        __trace.append("[BoolWrap.foo]")
        2i64
    }
}

func g<T>(x: T): Int64 where T <: I {
    x.foo()
}


@Test
class GeninstO0NativeTest {
    @TestCase
    func traceCheck(): Unit {

    let a = g<IntWrap>(IntWrap(0i64))
    let b = g<BoolWrap>(BoolWrap(true))
        @Expect(a, 1i64)
        @Expect(b, 2i64)
        @Expect(__trace.toString(), "[IntWrap.foo][BoolWrap.foo]")
    }
}
