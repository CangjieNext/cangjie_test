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
// Description: 实例方法与静态方法混合调用回归

// 实例方法与静态方法混合调用回归。
// 矩阵 §4.3。同一文件含实例方法虚调用（既有实例去虚化负责）与静态方法虚调用
// （本特性负责）。接口 A：抽象静态 foo + 默认 bar（bar 调 foo）；
// 抽象 instance baz()（由类实现）。类 A1 <: A 实现 foo + baz。经 A1 发起 bar()
// 与经实例 a1.baz()，两条路径并存，trace 与返回值在 O0/O2 须一致。
// 预期 trace：[A.bar][A1.foo][A1.baz]
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
    func baz(): Int64
}
class A1 <: A {
    public static func foo(): Int64 { __trace.append("[A1.foo]"); 1i64 }
    public func baz(): Int64 { __trace.append("[A1.baz]"); 1i64 }
}

@Test
class Sem02InstanceStaticMixTest {
    @TestCase
    func traceCheck(): Unit {
        A1.bar()
        let a1 = A1()
        a1.baz()
        @Expect(__trace.toString(), "[A.bar][A1.foo][A1.baz]")
    }
}

