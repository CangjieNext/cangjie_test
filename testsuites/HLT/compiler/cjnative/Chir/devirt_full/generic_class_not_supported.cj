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
// Description: 泛型类形态保守跳过不改写

// 泛型类形态保守跳过不改写。
// 预言机：接收类型仍带开放类型参数 T，无直接调用前提；本版本不优化，保持虚调用、语义保持。
// 预期 trace：[A1.foo][A.bar][A1.foo][A.bar][A1.foo]
// 口径：编译/运行/O0-O2 语义差分；exit 0、cjc --test 报 PASSED:1 FAILED:0、O0 与 O2 运行结果一致。
package packageA
import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
var __trace: StringBuilder = StringBuilder()
interface A {
    public static func foo(): Int64 { __trace.append("[A.foo]"); 1i64 }
    public static func bar(): Int64 { __trace.append("[A.bar]"); return foo() }
}
open class A1<T> <: A {
    public static func foo(): Int64 { __trace.append("[A1.foo]"); 1i64 }
}
func genericFunc6<T>(): Int64 { A1<T>.bar() }

@Test
class GenericClassNotSupportedTest {
    @TestCase
    func traceCheck(): Unit {
        let obj0: A1<Float64> = A1<Float64>(); A1<Float64>.foo(); A1<Float64>.bar(); genericFunc6<Int64>()
        @Expect(__trace.toString(), "[A1.foo][A.bar][A1.foo][A.bar][A1.foo]")
    }
}

