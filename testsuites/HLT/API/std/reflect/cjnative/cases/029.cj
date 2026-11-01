/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.reflect.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

public enum E0 {
    ConstructorA | ConstructorB | ConstructorC
}

public struct S0<T, U, G> {}

type MyT = S0<Int, String, Array<Array<Int>>>

@Test
class TestReflect {
    @TestCase
    func testCase0(): Unit {
        @Expect("default.S0<Int64, Bool, Rune>", TypeInfo.of<S0<Int64, Bool, Rune>>().toString())
        @Expect("Array<Int64>", TypeInfo.of<Array<Int64>>().toString())
        @Expect("Array<Box<Int64>>", TypeInfo.of<Array<Box<Int64>>>().toString())
        @Expect("Rune", TypeInfo.of<Rune>().toString())
        @Expect("Int64", TypeInfo.of<Int>().toString())
        @Expect("UInt64", TypeInfo.of<UInt>().toString())
        @Expect("default.S0<Int64, String, Array<Array<Int64>>>", TypeInfo.of<MyT>().toString())
        @Expect("String", TypeInfo.of<String>().toString())
        @Expect("Array<Array<Array<Int64>>>", TypeInfo.of<Array<Array<Array<Int64>>>>().toString())
        @Expect("Array<Int64>", TypeInfo.of<Array<Int64>>().toString())
    }
}
