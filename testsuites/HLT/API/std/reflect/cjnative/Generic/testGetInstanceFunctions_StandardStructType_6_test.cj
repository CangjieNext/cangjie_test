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
class testGetInstanceFunctions_StandardStructType_6 {
    @TestCase
    func TestCase_134(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, Int64, Unit>>().getInstanceFunctions("classInstanceMemberFunction_135").size)
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(StandardStructType<UInt8, Int64, Unit>(), [], [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#4203: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#4204: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4205: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(StandardStructType<UInt8, Int64, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4206: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4207: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#4208: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(StandardStructType<UInt8, Int64, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4209: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(StandardStructType<UInt8, Int64, Unit>(), [],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#4210: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(StandardStructType<UInt8, Int64, Unit>(), [], [()])
            @Expect("assertion#4211: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4212: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply("hello", [], [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#4213: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4214: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4215: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(1i64, [], [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#4216: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4217: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<UInt8, Int64, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
            .apply(StandardStructType<UInt8, Int64, Unit>(), [GenericClassWith2TypeParameters<UInt8, UInt8>()])
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#4218: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt8, Int64, Unit>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#4219: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt8, Int64, Unit>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(StandardStructType<UInt8, Int64, Unit>(), [])
            @Expect("assertion#4220: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4221: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply("hello", [])
            @Expect("assertion#4222: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(StandardStructType<UInt8, Int64, Unit>(), [])
            @Expect("assertion#4223: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4224: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply("hello", [])
            @Expect("assertion#4225: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(StandardStructType<UInt8, Int64, Unit>(),
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#4226: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#4227: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#4228: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(StandardStructType<UInt8, Int64, Unit>(), [()])
            @Expect("assertion#4229: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4230: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_135")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4231: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_135(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, Int64, Float32>>().getInstanceFunctions("classInstanceMemberFunction_136").size)
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply(StandardStructType<UInt8, Int64, Float32>(), [],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#4232: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#4233: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4234: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply(StandardStructType<UInt8, Int64, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4235: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4236: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4237: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply(StandardStructType<UInt8, Int64, Float32>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4238: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply(StandardStructType<UInt8, Int64, Float32>(), [],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4239: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply(StandardStructType<UInt8, Int64, Float32>(), [], [()])
            @Expect("assertion#4240: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4241: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply("hello", [], [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#4242: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4243: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4244: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply(1i64, [], [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4245: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4246: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<UInt8, Int64, Float32>>()
            .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
            .apply(StandardStructType<UInt8, Int64, Float32>(), [GenericClassWith2TypeParameters<Int64, Int64>()])
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#4247: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt8, Int64, Float32>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#4248: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt8, Int64, Float32>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply(StandardStructType<UInt8, Int64, Float32>(), [])
            @Expect("assertion#4249: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4250: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply("hello", [])
            @Expect("assertion#4251: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply(StandardStructType<UInt8, Int64, Float32>(), [])
            @Expect("assertion#4252: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4253: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply("hello", [])
            @Expect("assertion#4254: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply(StandardStructType<UInt8, Int64, Float32>(),
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4255: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4256: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4257: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply(StandardStructType<UInt8, Int64, Float32>(), [()])
            @Expect("assertion#4258: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4259: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int64, Float32>>()
                .getInstanceFunctions("classInstanceMemberFunction_136")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4260: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_136(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, Int16, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_137").size)
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(StandardStructType<Int32, Int16, UInt64>(), [],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#4261: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#4262: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4263: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(StandardStructType<Int32, Int16, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4264: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4265: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#4266: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(StandardStructType<Int32, Int16, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4267: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(StandardStructType<Int32, Int16, UInt64>(), [],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#4268: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(StandardStructType<Int32, Int16, UInt64>(), [], [()])
            @Expect("assertion#4269: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4270: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply("hello", [], [GenericClassWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#4271: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4272: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4273: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(1i64, [], [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#4274: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4275: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<Int32, Int16, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
            .apply(StandardStructType<Int32, Int16, UInt64>(), [GenericClassWith2TypeParameters<UInt64, UInt64>()])
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#4276: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int32, Int16, UInt64>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#4277: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int32, Int16, UInt64>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(StandardStructType<Int32, Int16, UInt64>(), [])
            @Expect("assertion#4278: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4279: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply("hello", [])
            @Expect("assertion#4280: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(StandardStructType<Int32, Int16, UInt64>(), [])
            @Expect("assertion#4281: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4282: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply("hello", [])
            @Expect("assertion#4283: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(StandardStructType<Int32, Int16, UInt64>(),
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#4284: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(1i64, [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#4285: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply("hello", [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#4286: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(StandardStructType<Int32, Int16, UInt64>(), [()])
            @Expect("assertion#4287: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4288: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_137")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4289: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_137(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, UInt8, Int8>>().getInstanceFunctions("classInstanceMemberFunction_138").size)
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int8>(), [], [NonGenericStruct()])
            @Expect("assertion#4290: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#4291: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4292: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4293: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4294: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4295: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4296: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int8>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4297: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int8>(), [], [()])
            @Expect("assertion#4298: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4299: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply("hello", [], [NonGenericStruct()])
            @Expect("assertion#4300: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4301: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4302: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(1i64, [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4303: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4304: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<Float64, UInt8, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
            .apply(StandardStructType<Float64, UInt8, Int8>(), [NonGenericStruct()])
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#4305: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, UInt8, Int8>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#4306: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, UInt8, Int8>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int8>(), [])
            @Expect("assertion#4307: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4308: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply("hello", [])
            @Expect("assertion#4309: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int8>(), [])
            @Expect("assertion#4310: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4311: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply("hello", [])
            @Expect("assertion#4312: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int8>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4313: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4314: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4315: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(StandardStructType<Float64, UInt8, Int8>(), [()])
            @Expect("assertion#4316: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4317: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, UInt8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_138")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4318: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_138(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Int32, Int8>>().getInstanceFunctions("classInstanceMemberFunction_139").size)
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(StandardStructType<Float64, Int32, Int8>(), [], [NonGenericStruct()])
            @Expect("assertion#4319: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#4320: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4321: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(StandardStructType<Float64, Int32, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4322: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4323: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4324: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(StandardStructType<Float64, Int32, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4325: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(StandardStructType<Float64, Int32, Int8>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4326: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(StandardStructType<Float64, Int32, Int8>(), [], [()])
            @Expect("assertion#4327: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4328: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply("hello", [], [NonGenericStruct()])
            @Expect("assertion#4329: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4330: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4331: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(1i64, [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4332: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4333: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<Float64, Int32, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
            .apply(StandardStructType<Float64, Int32, Int8>(), [NonGenericStruct()])
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#4334: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, Int32, Int8>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#4335: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, Int32, Int8>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(StandardStructType<Float64, Int32, Int8>(), [])
            @Expect("assertion#4336: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4337: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply("hello", [])
            @Expect("assertion#4338: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(StandardStructType<Float64, Int32, Int8>(), [])
            @Expect("assertion#4339: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4340: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply("hello", [])
            @Expect("assertion#4341: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(StandardStructType<Float64, Int32, Int8>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4342: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4343: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#4344: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(StandardStructType<Float64, Int32, Int8>(), [()])
            @Expect("assertion#4345: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4346: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_139")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4347: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }
}
