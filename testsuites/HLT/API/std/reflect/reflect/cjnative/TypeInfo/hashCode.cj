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
// (not MAC) RUN-EXEC: %cp ./MyType/libMyType_myType.%test_suffix .&& %run %run_opt %output %run_utest_opt %run_args
import std.reflect.*
import MyType.myType.*

@Test
class Test {
    @TestCase
    func testPrimitive(): Unit {
        @Expect(TypeInfo.of<Int8>().hashCode(), TypeInfo.get("Int8").hashCode())
    }
    @TestCase
    func testInterface(): Unit {
        @Expect(TypeInfo.of<I0>().hashCode(), TypeInfo.get("MyType.myType.I0").hashCode())
    }
    @TestCase
    func testClass(): Unit {
        @Expect(TypeInfo.of<C1>().hashCode(), TypeInfo.get("MyType.myType.C1").hashCode())
    }
    @TestCase
    func testStruct(): Unit {
        @Expect(TypeInfo.of<S1>().hashCode(), TypeInfo.get("MyType.myType.S1").hashCode())
    }
}
