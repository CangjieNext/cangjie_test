/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../MyType
// (not MAC) EXEC: cd ./MyType && %compiler %cmp_opt --output-type=dylib --module-name=MyType ./src/myType/*.cj -o libMyType.myType.%test_suffix
// (not MAC) EXEC: %compiler %cmp_opt -o %output %f %cmp_utest_opt
// (not MAC) RUN-EXEC: %cp ./MyType/libMyType.myType.%test_suffix .&& %run %run_opt %output %run_utest_opt %run_args
// 使用ModuleInfo和PackageInfo来获取动态加载的模块中的全局公开的变量、函数和类型。
import std.reflect.*

@Test
class Test {
    let packageInfo = PackageInfo.load("./MyType/libMyType.myType")

    @TestCase
    func test0(): Unit {
        @Expect(packageInfo.getFunction("public_global_function_0").toString(), "func public_global_function_0(): Unit")
        @Expect(packageInfo.getFunction("public_global_function_1", TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>()).toString(), "func public_global_function_1(Int8, Int16, Int32, Int64): IntNative")
        @Expect(packageInfo.getFunction("public_global_function_2", TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()).toString(), "func public_global_function_2(UInt8, UInt16, UInt32, UInt64): UIntNative")
        @Expect(packageInfo.getFunction("public_global_function_3", TypeInfo.of<Float16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()).toString(), "func public_global_function_3(Float16, Float32, Float64): Rune")
        @Expect(packageInfo.getFunction("public_global_function_4", TypeInfo.of<Unit>(), TypeInfo.get("MyType.myType.C1"), TypeInfo.get("MyType.myType.S1"), TypeInfo.of<Bool>()).toString(), "func public_global_function_4(Unit, MyType.myType.C1, MyType.myType.S1, Bool): String")
    }

    @TestCase
    func test1(): Unit {
        @Expect(packageInfo.getVariable("c1_0").toString(), "c1_0: MyType.myType.C1")
        @Expect(packageInfo.getVariable("c1_1").toString(), "c1_1: Any")
        @Expect(packageInfo.getVariable("c1_2").toString(), "c1_2: Object")
        @Expect(packageInfo.getVariable("c4_0").toString(), "c4_0: MyType.myType.C4")
        @Expect(packageInfo.getVariable("c4_1").toString(), "c4_1: MyType.myType.C2")
        @Expect(packageInfo.getVariable("s1_0").toString(), "s1_0: MyType.myType.S1")
        @Expect(packageInfo.getVariable("c5_0").toString(), "c5_0: MyType.myType.C5")
        @Expect(packageInfo.getVariable("c5_1").toString(), "c5_1: MyType.myType.I1")
    }
    @TestCase
    func test2(): Unit {
        // 公开class
        @Expect(packageInfo.getTypeInfo("MyType.myType.C1").toString(), "MyType.myType.C1")
        // 公开struct
        @Expect(packageInfo.getTypeInfo("MyType.myType.S1").toString(), "MyType.myType.S1")
        @Expect(packageInfo.getTypeInfo("MyType.myType.I1").toString(), "MyType.myType.I1")
        @Expect(packageInfo.getTypeInfo("MyType.myType.A1").toString(), "MyType.myType.A1")
    }
    @TestCase
    func test3(): Unit {
        // 尝试获取非公开类型。
        // @Expect(ModuleInfo.find("MyType").getPackageInfo("MyType.myType").getTypeInfo("MyType.myType.non_public_class").isNone())
        // @Expect(ModuleInfo.find("MyType").getPackageInfo("MyType.myType").getTypeInfo("MyType.myType.non_public_interface").isNone())

        // 尝试获取非公开全局函数。
        try {
            packageInfo.getFunction("global_function_0")
            @Assert(false)
        } catch (e: Exception) {
        }
        try {
            packageInfo.getFunction("global_function_1", TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>(),
                TypeInfo.of<Int64>())
            @Assert(false)
        } catch (e: Exception) {
        }
        try {
            packageInfo.getFunction("global_function_2", TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(),
                TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>())
            @Assert(false)
        } catch (e: Exception) {
        }
        try {
            packageInfo.getFunction("global_function_3", TypeInfo.of<Float16>(), TypeInfo.of<Float32>(),
                TypeInfo.of<Float64>())
            @Assert(false)
        } catch (e: Exception) {
        }
        try {
            packageInfo.getFunction("global_function_4", TypeInfo.of<Unit>(), TypeInfo.get("MyType.myType.C1"),
                TypeInfo.get("MyType.myType.S1"), TypeInfo.of<Bool>())
            @Assert(false)
        } catch (e: Exception) {
        }
        // 尝试获取非公开全局变量。
        try {
            packageInfo.getVariable("s1_1")
            @Assert(false)
        } catch (e: Exception) {
        }
        @Expect(packageInfo.getVariable("s_1").toString(), "s_1: String")
    }
}
