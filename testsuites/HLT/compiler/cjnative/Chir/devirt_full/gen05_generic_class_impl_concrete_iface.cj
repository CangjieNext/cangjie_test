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
// Description: 泛型类实现泛型接口后实例化命中

// 泛型类实现泛型接口后实例化命中。
// 矩阵 §4.3。泛型接口 A<T> 声明抽象静态 foo 返回 Int64 加默认 bar 调 foo，
// 泛型类 A1<T> 实现接口 A<T> 并覆写 foo（返回 Int64 而非 T 以避开泛型默认值障碍）。
// 实例化为 A1<Int64> 后经其发起 bar()，foo 解析到 A1<Int64>.foo。
// 预期 trace：[A.bar][A1.foo]
// 口径：编译/运行/O0-O2 语义差分；exit 0、cjc --test 报 PASSED:1 FAILED:0、O0 与 O2 运行结果一致。
package packageA
import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
var __trace: StringBuilder = StringBuilder()
interface A<T> {
    static func foo(): Int64 { __trace.append("[A.foo]"); 1i64 }
    static func bar(): Int64 { __trace.append("[A.bar]"); return foo() }
}
open class A1<T> <: A<T> {
    public static func foo(): Int64 { __trace.append("[A1.foo]"); 1i64 }
}

@Test
class Gen05GenericClassImplConcreteIfaceTest {
    @TestCase
    func traceCheck(): Unit {
        A1<Int64>.bar()
        @Expect(__trace.toString(), "[A.bar][A1.foo]")
    }
}

