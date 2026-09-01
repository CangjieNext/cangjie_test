/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

// Level: 1
// Description: 参数求值、返回值、trace 次数保持

// 参数求值、返回值、trace 次数保持。
// 矩阵 §4.3。验证优化不改变参数求值顺序、返回值与 trace 次数。
// foo 接受一个参数 p（有副作用写 trace [p]），bar 调 foo(evalSideEffect())。
// 经 A1 发起 bar()，参数副作用 + foo 体的 trace 次数与返回值在 O0/O2 须一致。
// 预期 trace：[sidep][A1.foo]
// 口径：编译/运行/O0-O2 语义差分；exit 0、cjc --test 报 PASSED:1 FAILED:0、O0 与 O2 运行结果一致。
package packageA
import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
var __trace: StringBuilder = StringBuilder()
interface A {
    static func foo(p: Int64): Int64 { __trace.append("[A.foo]"); p }
    static func bar(p: Int64): Int64 { __trace.append("[A.bar]"); return foo(p) }
}
class A1 <: A {
    public static func foo(p: Int64): Int64 { __trace.append("[A1.foo]"); p }
}
func sideEffect(p: Int64): Int64 { __trace.append("[sidep]"); p }

@Test
class Sem01EvalReturnCountTest {
    @TestCase
    func traceCheck(): Unit {
        let r = A1.bar(sideEffect(42))
        @Expect(r, 42i64)
        @Expect(__trace.toString(), "[sidep][A.bar][A1.foo]")
    }
}

