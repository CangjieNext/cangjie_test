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
class testGetInstanceFunctions_StandardStructType_2 {
    @TestCase
    func TestCase_114(): Unit {
        // logger.info("testcase TestCase_114 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_115").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt16>(), [], [true])
            @Expect("assertion#3623: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [true])
            @Expect("assertion#3624: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3625: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3626: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3627: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [true, 114.514000f64])
            @Expect("assertion#3628: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3629: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt16>(), [], [true, 114.514000f64])
            @Expect("assertion#3630: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt16>(), [], [()])
            @Expect("assertion#3631: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3632: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply("hello", [], [true])
            @Expect("assertion#3633: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3634: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3635: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(1i64, [], [true, 114.514000f64])
            @Expect("assertion#3636: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#3637: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int32, Int8, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
            .apply(StandardStructType<Int32, Int8, UInt16>(), [true])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(1i64, [true])
            @Expect("assertion#3638: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int32, Int8, UInt16>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply("hello", [true])
            @Expect("assertion#3639: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int32, Int8, UInt16>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt16>(), [])
            @Expect("assertion#3640: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3641: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply("hello", [])
            @Expect("assertion#3642: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt16>(), [])
            @Expect("assertion#3643: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3644: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply("hello", [])
            @Expect("assertion#3645: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt16>(), [true, 114.514000f64])
            @Expect("assertion#3646: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(1i64, [true, 114.514000f64])
            @Expect("assertion#3647: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply("hello", [true, 114.514000f64])
            @Expect("assertion#3648: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(StandardStructType<Int32, Int8, UInt16>(), [()])
            @Expect("assertion#3649: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3650: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_115")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3651: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_114 ends.")
    }

    @TestCase
    func TestCase_115(): Unit {
        // logger.info("testcase TestCase_115 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Int32, Unit>>().getInstanceFunctions("classInstanceMemberFunction_116").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(StandardStructType<Float64, Int32, Unit>(), [], [()])
            @Expect("assertion#3652: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3653: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3654: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(StandardStructType<Float64, Int32, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3655: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3656: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [(), 114.514000f64])
            @Expect("assertion#3657: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(StandardStructType<Float64, Int32, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3658: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(StandardStructType<Float64, Int32, Unit>(), [], [(), 114.514000f64])
            @Expect("assertion#3659: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(StandardStructType<Float64, Int32, Unit>(), [], [123i64])
            @Expect("assertion#3660: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#3661: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#3662: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3663: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3664: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(1i64, [], [(), 114.514000f64])
            @Expect("assertion#3665: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply("hello", [], [123i64])
            @Expect("assertion#3666: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, Int32, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
            .apply(StandardStructType<Float64, Int32, Unit>(), [()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3667: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, Int32, Unit>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3668: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, Int32, Unit>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(StandardStructType<Float64, Int32, Unit>(), [])
            @Expect("assertion#3669: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3670: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply("hello", [])
            @Expect("assertion#3671: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(StandardStructType<Float64, Int32, Unit>(), [])
            @Expect("assertion#3672: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3673: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply("hello", [])
            @Expect("assertion#3674: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(StandardStructType<Float64, Int32, Unit>(), [(), 114.514000f64])
            @Expect("assertion#3675: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(1i64, [(), 114.514000f64])
            @Expect("assertion#3676: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply("hello", [(), 114.514000f64])
            @Expect("assertion#3677: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(StandardStructType<Float64, Int32, Unit>(), [123i64])
            @Expect("assertion#3678: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply(1i64, [123i64])
            @Expect("assertion#3679: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int32, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_116")[0i64]
                .apply("hello", [123i64])
            @Expect("assertion#3680: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_115 ends.")
    }

    @TestCase
    func TestCase_116(): Unit {
        // logger.info("testcase TestCase_116 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, UInt16, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_117").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply(StandardStructType<Int64, UInt16, UInt16>(), [], [123i64])
            @Expect("assertion#3681: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#3682: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3683: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply(StandardStructType<Int64, UInt16, UInt16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3684: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3685: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [123i64, 114.514000f64])
            @Expect("assertion#3686: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply(StandardStructType<Int64, UInt16, UInt16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3687: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply(StandardStructType<Int64, UInt16, UInt16>(), [], [123i64, 114.514000f64])
            @Expect("assertion#3688: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply(StandardStructType<Int64, UInt16, UInt16>(), [], [114.514000f64])
            @Expect("assertion#3689: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#3690: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply("hello", [], [123i64])
            @Expect("assertion#3691: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3692: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3693: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply(1i64, [], [123i64, 114.514000f64])
            @Expect("assertion#3694: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply("hello", [], [114.514000f64])
            @Expect("assertion#3695: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int64, UInt16, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
            .apply(StandardStructType<Int64, UInt16, UInt16>(), [123i64])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply(1i64, [123i64])
            @Expect("assertion#3696: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int64, UInt16, UInt16>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply("hello", [123i64])
            @Expect("assertion#3697: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int64, UInt16, UInt16>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply(StandardStructType<Int64, UInt16, UInt16>(), [])
            @Expect("assertion#3698: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3699: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply("hello", [])
            @Expect("assertion#3700: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply(StandardStructType<Int64, UInt16, UInt16>(), [])
            @Expect("assertion#3701: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3702: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply("hello", [])
            @Expect("assertion#3703: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply(StandardStructType<Int64, UInt16, UInt16>(), [123i64, 114.514000f64])
            @Expect("assertion#3704: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply(1i64, [123i64, 114.514000f64])
            @Expect("assertion#3705: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply("hello", [123i64, 114.514000f64])
            @Expect("assertion#3706: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply(StandardStructType<Int64, UInt16, UInt16>(), [114.514000f64])
            @Expect("assertion#3707: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply(1i64, [114.514000f64])
            @Expect("assertion#3708: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, UInt16, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_117")[0i64]
                .apply("hello", [114.514000f64])
            @Expect("assertion#3709: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_116 ends.")
    }

    @TestCase
    func TestCase_117(): Unit {
        // logger.info("testcase TestCase_117 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Float32, Int8>>().getInstanceFunctions("classInstanceMemberFunction_118").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(StandardStructType<Float64, Float32, Int8>(), [], [114.514000f32])
            @Expect("assertion#3710: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [114.514000f32])
            @Expect("assertion#3711: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3712: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(StandardStructType<Float64, Float32, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3713: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3714: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [114.514000f32, 114.514000f64])
            @Expect("assertion#3715: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(StandardStructType<Float64, Float32, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3716: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(StandardStructType<Float64, Float32, Int8>(), [], [114.514000f32, 114.514000f64])
            @Expect("assertion#3717: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(StandardStructType<Float64, Float32, Int8>(), [], [()])
            @Expect("assertion#3718: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3719: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply("hello", [], [114.514000f32])
            @Expect("assertion#3720: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3721: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3722: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(1i64, [], [114.514000f32, 114.514000f64])
            @Expect("assertion#3723: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#3724: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, Float32, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
            .apply(StandardStructType<Float64, Float32, Int8>(), [114.514000f32])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(1i64, [114.514000f32])
            @Expect("assertion#3725: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, Float32, Int8>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply("hello", [114.514000f32])
            @Expect("assertion#3726: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Float64, Float32, Int8>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(StandardStructType<Float64, Float32, Int8>(), [])
            @Expect("assertion#3727: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3728: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply("hello", [])
            @Expect("assertion#3729: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(StandardStructType<Float64, Float32, Int8>(), [])
            @Expect("assertion#3730: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3731: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply("hello", [])
            @Expect("assertion#3732: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(StandardStructType<Float64, Float32, Int8>(), [114.514000f32, 114.514000f64])
            @Expect("assertion#3733: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(1i64, [114.514000f32, 114.514000f64])
            @Expect("assertion#3734: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply("hello", [114.514000f32, 114.514000f64])
            @Expect("assertion#3735: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(StandardStructType<Float64, Float32, Int8>(), [()])
            @Expect("assertion#3736: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3737: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_118")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3738: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_117 ends.")
    }

    @TestCase
    func TestCase_118(): Unit {
        // logger.info("testcase TestCase_118 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, Int8, Unit>>().getInstanceFunctions("classInstanceMemberFunction_119").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(StandardStructType<UInt16, Int8, Unit>(), [], [()])
            @Expect("assertion#3739: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#3740: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3741: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(StandardStructType<UInt16, Int8, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3742: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3743: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [(), 114.514000f64])
            @Expect("assertion#3744: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(StandardStructType<UInt16, Int8, Unit>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#3745: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(StandardStructType<UInt16, Int8, Unit>(), [], [(), 114.514000f64])
            @Expect("assertion#3746: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(StandardStructType<UInt16, Int8, Unit>(), [], [123i64])
            @Expect("assertion#3747: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#3748: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#3749: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#3750: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#3751: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(1i64, [], [(), 114.514000f64])
            @Expect("assertion#3752: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply("hello", [], [123i64])
            @Expect("assertion#3753: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt16, Int8, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
            .apply(StandardStructType<UInt16, Int8, Unit>(), [()])
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#3754: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt16, Int8, Unit>\", but now it`s \"Int64\"")
        }
        // logger.info("实例类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply("hello", [()])
            @Expect("assertion#3755: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt16, Int8, Unit>\", but now it`s \"String\"")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(StandardStructType<UInt16, Int8, Unit>(), [])
            @Expect("assertion#3756: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3757: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply("hello", [])
            @Expect("assertion#3758: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(StandardStructType<UInt16, Int8, Unit>(), [])
            @Expect("assertion#3759: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(1i64, [])
            @Expect("assertion#3760: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply("hello", [])
            @Expect("assertion#3761: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(StandardStructType<UInt16, Int8, Unit>(), [(), 114.514000f64])
            @Expect("assertion#3762: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(1i64, [(), 114.514000f64])
            @Expect("assertion#3763: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply("hello", [(), 114.514000f64])
            @Expect("assertion#3764: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(StandardStructType<UInt16, Int8, Unit>(), [123i64])
            @Expect("assertion#3765: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply(1i64, [123i64])
            @Expect("assertion#3766: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int8, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_119")[0i64]
                .apply("hello", [123i64])
            @Expect("assertion#3767: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("testcase TestCase_118 ends.")
    }
}
