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
class testGetInstanceFunctions_StandardStructType_4 {
    @TestCase
    func TestCase_124(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, Int8, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_125").size)
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt64>(), [], [NonGenericClass()])
            @Expect("assertion#3913: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#3914: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3915: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3916: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3917: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3918: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3919: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt64>(), [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3920: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt64>(), [], [()])
            @Expect("assertion#3921: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3922: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply("hello", [], [NonGenericClass()])
            @Expect("assertion#3923: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3924: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3925: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(1i64, [], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3926: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#3927: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<Int32, Int8, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
            .apply(StandardStructType<Int32, Int8, UInt64>(), [NonGenericClass()])
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#3928: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int32, Int8, UInt64>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#3929: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int32, Int8, UInt64>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt64>(), [])
            @Expect("assertion#3930: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3931: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply("hello", [])
            @Expect("assertion#3932: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt64>(), [])
            @Expect("assertion#3933: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3934: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply("hello", [])
            @Expect("assertion#3935: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3936: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3937: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#3938: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt64>(), [()])
            @Expect("assertion#3939: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3940: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_125")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3941: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_125(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, UInt64, Int64>>().getInstanceFunctions("classInstanceMemberFunction_126").size)
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(StandardStructType<Bool, UInt64, Int64>(), [], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#3942: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#3943: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3944: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(StandardStructType<Bool, UInt64, Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3945: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3946: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3947: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(StandardStructType<Bool, UInt64, Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3948: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(StandardStructType<Bool, UInt64, Int64>(), [],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3949: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(StandardStructType<Bool, UInt64, Int64>(), [], [()])
            @Expect("assertion#3950: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3951: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply("hello", [], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#3952: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3953: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3954: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(1i64, [], [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3955: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#3956: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<Bool, UInt64, Int64>>()
            .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
            .apply(StandardStructType<Bool, UInt64, Int64>(), [GenericClassWith1TypeParameters<Int64>()])
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#3957: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Bool, UInt64, Int64>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#3958: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Bool, UInt64, Int64>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(StandardStructType<Bool, UInt64, Int64>(), [])
            @Expect("assertion#3959: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3960: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply("hello", [])
            @Expect("assertion#3961: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(StandardStructType<Bool, UInt64, Int64>(), [])
            @Expect("assertion#3962: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3963: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply("hello", [])
            @Expect("assertion#3964: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(StandardStructType<Bool, UInt64, Int64>(),
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3965: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3966: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#3967: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(StandardStructType<Bool, UInt64, Int64>(), [()])
            @Expect("assertion#3968: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3969: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt64, Int64>>()
                .getInstanceFunctions("classInstanceMemberFunction_126")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3970: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_126(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, Unit, Int16>>().getInstanceFunctions("classInstanceMemberFunction_127").size)
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(StandardStructType<UInt16, Unit, Int16>(), [], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#3971: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#3972: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3973: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(StandardStructType<UInt16, Unit, Int16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3974: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3975: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#3976: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(StandardStructType<UInt16, Unit, Int16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3977: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(StandardStructType<UInt16, Unit, Int16>(), [],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#3978: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(StandardStructType<UInt16, Unit, Int16>(), [], [()])
            @Expect("assertion#3979: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3980: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply("hello", [], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#3981: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3982: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3983: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(1i64, [], [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#3984: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#3985: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<UInt16, Unit, Int16>>()
            .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
            .apply(StandardStructType<UInt16, Unit, Int16>(), [GenericClassWith1TypeParameters<Bool>()])
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#3986: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt16, Unit, Int16>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#3987: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt16, Unit, Int16>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(StandardStructType<UInt16, Unit, Int16>(), [])
            @Expect("assertion#3988: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3989: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply("hello", [])
            @Expect("assertion#3990: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(StandardStructType<UInt16, Unit, Int16>(), [])
            @Expect("assertion#3991: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3992: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply("hello", [])
            @Expect("assertion#3993: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(StandardStructType<UInt16, Unit, Int16>(),
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#3994: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#3995: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#3996: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(StandardStructType<UInt16, Unit, Int16>(), [()])
            @Expect("assertion#3997: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3998: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Unit, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_127")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3999: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_127(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, Int16, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_128").size)
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(StandardStructType<Int64, Int16, UInt16>(), [], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#4000: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#4001: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4002: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(StandardStructType<Int64, Int16, UInt16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4003: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4004: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#4005: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(StandardStructType<Int64, Int16, UInt16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4006: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(StandardStructType<Int64, Int16, UInt16>(), [],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#4007: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(StandardStructType<Int64, Int16, UInt16>(), [], [()])
            @Expect("assertion#4008: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4009: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply("hello", [], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#4010: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4011: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4012: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(1i64, [], [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#4013: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4014: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<Int64, Int16, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
            .apply(StandardStructType<Int64, Int16, UInt16>(), [GenericClassWith1TypeParameters<Unit>()])
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#4015: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int64, Int16, UInt16>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#4016: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int64, Int16, UInt16>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(StandardStructType<Int64, Int16, UInt16>(), [])
            @Expect("assertion#4017: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4018: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply("hello", [])
            @Expect("assertion#4019: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(StandardStructType<Int64, Int16, UInt16>(), [])
            @Expect("assertion#4020: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4021: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply("hello", [])
            @Expect("assertion#4022: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(StandardStructType<Int64, Int16, UInt16>(),
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#4023: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#4024: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#4025: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(StandardStructType<Int64, Int16, UInt16>(), [()])
            @Expect("assertion#4026: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4027: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_128")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4028: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_128(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, UInt32, UInt64>>().getInstanceFunctions("classInstanceMemberFunction_129").size)
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [], [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#4029: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#4030: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4031: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4032: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4033: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#4034: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4035: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [],
                    [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#4036: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [], [()])
            @Expect("assertion#4037: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4038: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply("hello", [], [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#4039: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4040: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4041: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(1i64, [], [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#4042: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4043: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<Float32, UInt32, UInt64>>()
            .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
            .apply(StandardStructType<Float32, UInt32, UInt64>(), [GenericClassWith1TypeParameters<Float32>()])
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#4044: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float32, UInt32, UInt64>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#4045: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float32, UInt32, UInt64>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [])
            @Expect("assertion#4046: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4047: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply("hello", [])
            @Expect("assertion#4048: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [])
            @Expect("assertion#4049: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4050: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply("hello", [])
            @Expect("assertion#4051: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(),
                    [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#4052: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(1i64, [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#4053: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply("hello", [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#4054: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(StandardStructType<Float32, UInt32, UInt64>(), [()])
            @Expect("assertion#4055: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4056: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt64>>()
                .getInstanceFunctions("classInstanceMemberFunction_129")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4057: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }
}
