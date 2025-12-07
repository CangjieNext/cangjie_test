/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../MyType
// (not MAC) EXEC: cd ./MyType && %compiler %cmp_opt --output-type=dylib --module-name=MyType ./src/myType/*.cj -o libMyType_myType.%test_suffix
// (not MAC) EXEC: %compiler %cmp_opt -o %output %f --import-path . -L ./MyType -lMyType_myType %cmp_utest_opt
// (not MAC) RUN-EXEC: %cp ./MyType/libMyType_myType.%test_suffix .&& %run %run_opt %output %run_args
import std.reflect.*
import MyType.myType.*

@Test
class Test {
    @TestCase
    func testPrimitive(): Unit {
        // 所有原始数据类型都是Any的子类型。
        @Expect(TypeInfo.of<Int16>().isSubtypeOf(TypeInfo.of<Any>()), true)
        @Expect(TypeInfo.of<Int8>().isSubtypeOf(TypeInfo.of<Int8>()), true)
        @Expect(TypeInfo.of<Rune>().isSubtypeOf(TypeInfo.of<Rune>()), true)
        @Expect(TypeInfo.of<UInt32>().isSubtypeOf(TypeInfo.of<Int8>()), false)
        @Expect(TypeInfo.of<Float32>().isSubtypeOf(TypeInfo.of<Unit>()), false)
    }
    @TestCase
    func testInterface(): Unit {
        @Expect(TypeInfo.of<I0>().isSubtypeOf(TypeInfo.of<Any>()), true)
        @Expect(TypeInfo.of<I1>().isSubtypeOf(TypeInfo.of<I1>()), true)
        @Expect(TypeInfo.of<I2>().isSubtypeOf(TypeInfo.of<I2>()), true)
        @Expect(TypeInfo.of<I3>().isSubtypeOf(TypeInfo.of<Any>()), true)
        @Expect(TypeInfo.of<I4>().isSubtypeOf(TypeInfo.of<I1>()), true)
        @Expect(TypeInfo.of<I5>().isSubtypeOf(TypeInfo.of<I1>()), true)
        @Expect(TypeInfo.of<I5>().isSubtypeOf(TypeInfo.of<I2>()), true)
        @Expect(TypeInfo.of<I5>().isSubtypeOf(TypeInfo.of<I3>()), true)
        @Expect(TypeInfo.of<I6>().isSubtypeOf(TypeInfo.of<I4>()), true)
        @Expect(TypeInfo.of<I6>().isSubtypeOf(TypeInfo.of<I1>()), true)
    }
    @TestCase
    func testClass(): Unit {
        @Expect(TypeInfo.of<C4>().isSubtypeOf(TypeInfo.of<C2>()), true)
        @Expect(TypeInfo.of<C5>().isSubtypeOf(TypeInfo.of<I1>()), true)
        @Expect(TypeInfo.of<C6>().isSubtypeOf(TypeInfo.of<C3>()), true)
        @Expect(TypeInfo.of<C8>().isSubtypeOf(TypeInfo.of<I1>()), true)
        @Expect(TypeInfo.of<C8>().isSubtypeOf(TypeInfo.of<I2>()), true)
        @Expect(TypeInfo.of<C8>().isSubtypeOf(TypeInfo.of<I3>()), true)
        @Expect(TypeInfo.of<C9>().isSubtypeOf(TypeInfo.of<C4>()), true)
        @Expect(TypeInfo.of<C9>().isSubtypeOf(TypeInfo.of<C2>()), true)
    }
    @TestCase
    func testStruct(): Unit {
        @Expect(TypeInfo.of<S0>().isSubtypeOf(TypeInfo.of<Any>()), true)
        @Expect(TypeInfo.of<S1>().isSubtypeOf(TypeInfo.of<Any>()), true)
        // 目前 struct 类型的父接口只能获取 Any。
        // @Expect(TypeInfo.of<S2>().isSubtypeOf(TypeInfo.of<I1>()), true)
        // @Expect(TypeInfo.of<S3>().isSubtypeOf(TypeInfo.of<I1>()), true)
        // @Expect(TypeInfo.of<S3>().isSubtypeOf(TypeInfo.of<I2>()), true)
        // @Expect(TypeInfo.of<S3>().isSubtypeOf(TypeInfo.of<I3>()), true)
    }
}
