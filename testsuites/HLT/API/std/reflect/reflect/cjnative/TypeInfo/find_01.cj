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
        @Expect(TypeInfo.get("Int8").toString(), "Int8")
        @Expect(TypeInfo.get("Int16").toString(), "Int16")
        @Expect(TypeInfo.get("Int32").toString(), "Int32")
        @Expect(TypeInfo.get("Int64").toString(), "Int64")
        @Expect(TypeInfo.get("IntNative").toString(), "IntNative")
        @Expect(TypeInfo.get("UInt8").toString(), "UInt8")
        @Expect(TypeInfo.get("UInt16").toString(), "UInt16")
        @Expect(TypeInfo.get("UInt32").toString(), "UInt32")
        @Expect(TypeInfo.get("UInt64").toString(), "UInt64")
        @Expect(TypeInfo.get("UIntNative").toString(), "UIntNative")
        @Expect(TypeInfo.get("Float16").toString(), "Float16")
        @Expect(TypeInfo.get("Float32").toString(), "Float32")
        @Expect(TypeInfo.get("Float64").toString(), "Float64")
        @Expect(TypeInfo.get("Bool").toString(), "Bool")
        @Expect(TypeInfo.get("Rune").toString(), "Rune")
    }
}
