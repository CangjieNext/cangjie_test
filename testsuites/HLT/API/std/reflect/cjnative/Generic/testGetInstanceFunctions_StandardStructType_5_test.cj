/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1 
// DEPENDENCE: dependency
// (not MAC) EXEC: cd dependency && %compiler %cmp_opt --output-type=dylib  *.cj -o libdependency.%test_suffix
// (not MAC) EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output --import-path . -L dependency -ldependency
// (not MAC) RUN-EXEC: %cp ./dependency/libdependency.%test_suffix .&& %run %run_opt %output %run_utest_opt %run_args  
package testsuite

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import std.reflect.*
import dependency.*

@Test
class testGetInstanceFunctions_StandardStructType_5 {
    @TestCase
    func TestCase_129(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, UInt32, Float32>>().getInstanceFunctions("classInstanceMemberFunction_130").size)
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(StandardStructType<UInt8, UInt32, Float32>(), [], [GenericClassWith1TypeParameters<UInt32>()])
            @Expect("assertion#4058: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<UInt32>()])
            @Expect("assertion#4059: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4060: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(StandardStructType<UInt8, UInt32, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4061: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4062: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#4063: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(StandardStructType<UInt8, UInt32, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4064: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(StandardStructType<UInt8, UInt32, Float32>(), [],
                    [GenericClassWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#4065: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(StandardStructType<UInt8, UInt32, Float32>(), [], [()])
            @Expect("assertion#4066: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4067: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply("hello", [], [GenericClassWith1TypeParameters<UInt32>()])
            @Expect("assertion#4068: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4069: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4070: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(1i64, [], [GenericClassWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#4071: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4072: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<UInt8, UInt32, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
            .apply(StandardStructType<UInt8, UInt32, Float32>(), [GenericClassWith1TypeParameters<UInt32>()])
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<UInt32>()])
            @Expect("assertion#4073: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt8, UInt32, Float32>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<UInt32>()])
            @Expect("assertion#4074: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt8, UInt32, Float32>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(StandardStructType<UInt8, UInt32, Float32>(), [])
            @Expect("assertion#4075: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4076: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply("hello", [])
            @Expect("assertion#4077: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(StandardStructType<UInt8, UInt32, Float32>(), [])
            @Expect("assertion#4078: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4079: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply("hello", [])
            @Expect("assertion#4080: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(StandardStructType<UInt8, UInt32, Float32>(),
                    [GenericClassWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#4081: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#4082: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#4083: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(StandardStructType<UInt8, UInt32, Float32>(), [()])
            @Expect("assertion#4084: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4085: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, UInt32, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_130")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4086: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_130(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, Float32, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_131").size)
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(StandardStructType<UInt32, Float32, UInt64>(), [], [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#4087: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#4088: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4089: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(StandardStructType<UInt32, Float32, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4090: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4091: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#4092: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(StandardStructType<UInt32, Float32, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4093: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(StandardStructType<UInt32, Float32, UInt64>(), [],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#4094: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(StandardStructType<UInt32, Float32, UInt64>(), [], [()])
            @Expect("assertion#4095: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4096: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply("hello", [], [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#4097: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4098: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4099: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(1i64, [], [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#4100: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4101: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<UInt32, Float32, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
            .apply(StandardStructType<UInt32, Float32, UInt64>(), [GenericClassWith1TypeParameters<UInt64>()])
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#4102: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt32, Float32, UInt64>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#4103: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt32, Float32, UInt64>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(StandardStructType<UInt32, Float32, UInt64>(), [])
            @Expect("assertion#4104: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4105: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply("hello", [])
            @Expect("assertion#4106: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(StandardStructType<UInt32, Float32, UInt64>(), [])
            @Expect("assertion#4107: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4108: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply("hello", [])
            @Expect("assertion#4109: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(StandardStructType<UInt32, Float32, UInt64>(),
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#4110: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#4111: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#4112: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(StandardStructType<UInt32, Float32, UInt64>(), [()])
            @Expect("assertion#4113: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4114: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_131")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4115: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_131(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, Int8, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_132").size)
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(StandardStructType<Int16, Int8, UInt8>(), [], [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#4116: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#4117: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4118: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(StandardStructType<Int16, Int8, UInt8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4119: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4120: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4121: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(StandardStructType<Int16, Int8, UInt8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4122: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(StandardStructType<Int16, Int8, UInt8>(), [],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4123: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(StandardStructType<Int16, Int8, UInt8>(), [], [()])
            @Expect("assertion#4124: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4125: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply("hello", [], [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#4126: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4127: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4128: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(1i64, [], [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4129: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4130: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<Int16, Int8, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
            .apply(StandardStructType<Int16, Int8, UInt8>(), [GenericClassWith2TypeParameters<Int64, Int64>()])
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#4131: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int16, Int8, UInt8>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#4132: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int16, Int8, UInt8>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(StandardStructType<Int16, Int8, UInt8>(), [])
            @Expect("assertion#4133: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4134: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply("hello", [])
            @Expect("assertion#4135: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(StandardStructType<Int16, Int8, UInt8>(), [])
            @Expect("assertion#4136: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4137: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply("hello", [])
            @Expect("assertion#4138: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(StandardStructType<Int16, Int8, UInt8>(),
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4139: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4140: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4141: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(StandardStructType<Int16, Int8, UInt8>(), [()])
            @Expect("assertion#4142: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4143: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int8, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_132")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4144: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_132(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, UInt64, Unit>>().getInstanceFunctions("classInstanceMemberFunction_133").size)
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(StandardStructType<Float32, UInt64, Unit>(), [], [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4145: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4146: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4147: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(StandardStructType<Float32, UInt64, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4148: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4149: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4150: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(StandardStructType<Float32, UInt64, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4151: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(StandardStructType<Float32, UInt64, Unit>(), [],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4152: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(StandardStructType<Float32, UInt64, Unit>(), [], [()])
            @Expect("assertion#4153: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4154: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply("hello", [], [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4155: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4156: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4157: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(1i64, [], [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4158: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4159: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<Float32, UInt64, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
            .apply(StandardStructType<Float32, UInt64, Unit>(), [GenericClassWith2TypeParameters<Bool, Bool>()])
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4160: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float32, UInt64, Unit>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4161: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float32, UInt64, Unit>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(StandardStructType<Float32, UInt64, Unit>(), [])
            @Expect("assertion#4162: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4163: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply("hello", [])
            @Expect("assertion#4164: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(StandardStructType<Float32, UInt64, Unit>(), [])
            @Expect("assertion#4165: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4166: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply("hello", [])
            @Expect("assertion#4167: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(StandardStructType<Float32, UInt64, Unit>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4168: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4169: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4170: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(StandardStructType<Float32, UInt64, Unit>(), [()])
            @Expect("assertion#4171: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4172: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_133")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4173: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_133(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, UInt64, Float32>>().getInstanceFunctions("classInstanceMemberFunction_134").size)
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(StandardStructType<Float64, UInt64, Float32>(), [],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#4174: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#4175: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4176: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(StandardStructType<Float64, UInt64, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4177: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4178: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#4179: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(StandardStructType<Float64, UInt64, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4180: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(StandardStructType<Float64, UInt64, Float32>(), [],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#4181: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(StandardStructType<Float64, UInt64, Float32>(), [], [()])
            @Expect("assertion#4182: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4183: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply("hello", [], [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#4184: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4185: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4186: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(1i64, [], [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#4187: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4188: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<Float64, UInt64, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
            .apply(StandardStructType<Float64, UInt64, Float32>(), [GenericClassWith2TypeParameters<Unit, Unit>()])
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#4189: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, UInt64, Float32>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#4190: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, UInt64, Float32>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(StandardStructType<Float64, UInt64, Float32>(), [])
            @Expect("assertion#4191: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4192: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply("hello", [])
            @Expect("assertion#4193: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(StandardStructType<Float64, UInt64, Float32>(), [])
            @Expect("assertion#4194: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4195: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply("hello", [])
            @Expect("assertion#4196: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(StandardStructType<Float64, UInt64, Float32>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#4197: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#4198: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#4199: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(StandardStructType<Float64, UInt64, Float32>(), [()])
            @Expect("assertion#4200: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4201: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_134")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4202: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }
}
