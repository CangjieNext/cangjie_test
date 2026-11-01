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
// Description: 接收类型编译期不确定时保守不改写

// 接收类型编译期不确定时保守不改写。
// 测试设计 §优化边界清单。泛型函数 callOn<T>() where T <: A，函数体内调用 T.bar()，
// 接收类型为泛型参数 T 本身、函数体内未钉死具体类，本版本不优化、保持虚调用；语义正确。
// 不以「未优化」判失败，运行结果无法区分已优化与保持虚调用。
// 预期 trace：[A.bar][A1.foo]
// 口径：编译/运行/O0-O2 语义差分；exit 0、cjc --test 报 PASSED:1 FAILED:0、O0 与 O2 运行结果一致。
package packageA
import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
var __trace: StringBuilder = StringBuilder()
interface A {
    static func foo(): Int64 { __trace.append("[A.foo]"); 1i64 }
    static func bar(): Int64 { __trace.append("[A.bar]"); return foo() }
}
open class A1 <: A {
    public static func foo(): Int64 { __trace.append("[A1.foo]"); 1i64 }
}
func callOn<T>(): Int64 where T <: A { return T.bar() }

@Test
class TypeUnknownKeepVirtualTest {
    @TestCase
    func traceCheck(): Unit {
        callOn<A1>()
        @Expect(__trace.toString(), "[A.bar][A1.foo]")
    }
}

