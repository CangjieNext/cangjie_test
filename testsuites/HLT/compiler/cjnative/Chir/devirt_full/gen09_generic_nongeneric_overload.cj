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
// Description: 泛型与非泛型同名方法按完整类型签名可区分

// 泛型与非泛型同名方法按完整类型签名可区分。
// 矩阵 §4.3。接口 A 声明非泛型静态 fooN 与泛型静态 fooG<T>，以及默认 bar 调 fooN、默认泛型 baz 调 fooG<T>，
// 类 A1 覆写两者。经 A1 发起 bar() 与 baz<Int64>()，两条路径按完整类型签名区分、分别命中。
// 注：仓颉不允许同签名仅按是否泛型区分的重载（报重载冲突），故用不同方法名 fooN/fooG 表达等价语义。
// 预期 trace：[A.bar][A1.fooN][A.baz][A1.fooG]
// 口径：编译/运行/O0-O2 语义差分；exit 0、cjc --test 报 PASSED:1 FAILED:0、O0 与 O2 运行结果一致。
package packageA
import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
var __trace: StringBuilder = StringBuilder()
interface A {
    static func fooN(): Int64 { __trace.append("[A.fooN]"); 1i64 }
    static func fooG<T>(): Int64 { __trace.append("[A.fooG]"); 1i64 }
    static func bar(): Int64 { __trace.append("[A.bar]"); return fooN() }
    static func baz<T>(): Int64 { __trace.append("[A.baz]"); return fooG<T>() }
}
class A1 <: A {
    public static func fooN(): Int64 { __trace.append("[A1.fooN]"); 1i64 }
    public static func fooG<T>(): Int64 { __trace.append("[A1.fooG]"); 1i64 }
}

@Test
class Gen09GenericNongenericOverloadTest {
    @TestCase
    func traceCheck(): Unit {
        A1.bar()
        A1.baz<Int64>()
        @Expect(__trace.toString(), "[A.bar][A1.fooN][A.baz][A1.fooG]")
    }
}

