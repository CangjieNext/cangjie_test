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
// Description: 泛型函数特化后静态调用去虚化

// 泛型函数特化后静态调用去虚化。
// 预言机：泛型函数 genericFunc<T> 特化到 A1 后，T.bar() 内层静态调用接收类型编译期已知为 A1，去虚化到 A1.foo。
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
open class A1 <: A {
    public static func foo(): Int64 { __trace.append("[A1.foo]"); 1i64 }
}
func genericFunc3<T>(): Int64 where T <: A { return T.bar() }

@Test
class StaticInGenericInstTest {
    @TestCase
    func traceCheck(): Unit {
        let obj0: A1 = A1(); A1.foo(); A1.bar(); genericFunc3<A1>()
        @Expect(__trace.toString(), "[A1.foo][A.bar][A1.foo][A.bar][A1.foo]")
    }
}

