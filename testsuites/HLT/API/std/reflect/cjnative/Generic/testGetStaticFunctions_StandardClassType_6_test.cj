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
class testGetStaticFunctions_StandardClassType_6 {
    @TestCase
    func TestCase_243(): Unit {
        // logger.info("testcase TestCase_243 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, UInt32, Int16>>().getStaticFunctions("classStaticMemberFunction_26").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int16>>(), [],
                    [GenericClassWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#7439: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#7440: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7441: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int16>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7442: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int16>>(), [], [])
            @Expect("assertion#7443: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7444: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int16>>(), [],
                    [GenericClassWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#7445: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#7446: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int16>>(), [], [()])
            @Expect("assertion#7447: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7448: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt32, UInt32, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_26")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int16>>(),
                [GenericClassWith2TypeParameters<UInt32, UInt32>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#7449: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int16>>(), [])
            @Expect("assertion#7450: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7451: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int16>>(), [])
            @Expect("assertion#7452: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7453: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt32, Int16> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int16>>(),
                    [GenericClassWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#7454: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#7455: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt32, Int16> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int16>>(), [()])
            @Expect("assertion#7456: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_26")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7457: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt32, Int16> got.")
        }
        // logger.info("testcase TestCase_243 ends.")
    }

    @TestCase
    func TestCase_244(): Unit {
        // logger.info("testcase TestCase_244 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float64, Int64, UInt64>>().getStaticFunctions("classStaticMemberFunction_27").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_27")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, UInt64>>(), [],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#7458: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_27")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#7459: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_27")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7460: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_27")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, UInt64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7461: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_27")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, UInt64>>(), [], [])
            @Expect("assertion#7462: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_27")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7463: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_27")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, UInt64>>(), [],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#7464: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_27")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#7465: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_27")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, UInt64>>(), [], [()])
            @Expect("assertion#7466: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_27")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7467: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float64, Int64, UInt64>>()
            .getStaticFunctions("classStaticMemberFunction_27")[0i64]
            .apply(TypeInfo.of<StandardClassType<Float64, Int64, UInt64>>(),
                [GenericClassWith2TypeParameters<Int64, Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_27")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#7468: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, Int64, UInt64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_27")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, UInt64>>(), [])
            @Expect("assertion#7469: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_27")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7470: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, Int64, UInt64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_27")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, UInt64>>(), [])
            @Expect("assertion#7471: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_27")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7472: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, Int64, UInt64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_27")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, UInt64>>(),
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#7473: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_27")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#7474: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, Int64, UInt64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_27")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, UInt64>>(), [()])
            @Expect("assertion#7475: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_27")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7476: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, Int64, UInt64> got.")
        }
        // logger.info("testcase TestCase_244 ends.")
    }

    @TestCase
    func TestCase_245(): Unit {
        // logger.info("testcase TestCase_245 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, Bool, Int32>>().getStaticFunctions("classStaticMemberFunction_28").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_28")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Bool, Int32>>(), [],
                    [GenericClassWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#7477: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_28")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#7478: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_28")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7479: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_28")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Bool, Int32>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7480: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_28")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Bool, Int32>>(), [], [])
            @Expect("assertion#7481: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_28")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7482: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_28")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Bool, Int32>>(), [],
                    [GenericClassWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#7483: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_28")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#7484: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_28")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Bool, Int32>>(), [], [()])
            @Expect("assertion#7485: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_28")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7486: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int32, Bool, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_28")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int32, Bool, Int32>>(),
                [GenericClassWith2TypeParameters<Int32, Int32>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_28")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#7487: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Bool, Int32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_28")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Bool, Int32>>(), [])
            @Expect("assertion#7488: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_28")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7489: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Bool, Int32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_28")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Bool, Int32>>(), [])
            @Expect("assertion#7490: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_28")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7491: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Bool, Int32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_28")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Bool, Int32>>(),
                    [GenericClassWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#7492: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_28")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#7493: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Bool, Int32> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_28")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, Bool, Int32>>(), [()])
            @Expect("assertion#7494: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, Bool, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_28")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7495: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, Bool, Int32> got.")
        }
        // logger.info("testcase TestCase_245 ends.")
    }

    @TestCase
    func TestCase_246(): Unit {
        // logger.info("testcase TestCase_246 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float64, UInt16, Float64>>().getStaticFunctions("classStaticMemberFunction_29").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_29")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, Float64>>(), [], [NonGenericStruct()])
            @Expect("assertion#7496: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_29")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#7497: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_29")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7498: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_29")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, Float64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7499: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_29")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, Float64>>(), [], [])
            @Expect("assertion#7500: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_29")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7501: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_29")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, Float64>>(), [],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7502: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_29")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7503: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_29")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, Float64>>(), [], [()])
            @Expect("assertion#7504: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_29")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7505: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float64, UInt16, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_29")[0i64]
            .apply(TypeInfo.of<StandardClassType<Float64, UInt16, Float64>>(), [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_29")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#7506: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, UInt16, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_29")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, Float64>>(), [])
            @Expect("assertion#7507: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_29")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7508: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, UInt16, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_29")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, Float64>>(), [])
            @Expect("assertion#7509: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_29")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7510: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, UInt16, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_29")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, Float64>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7511: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_29")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7512: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, UInt16, Float64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_29")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, UInt16, Float64>>(), [()])
            @Expect("assertion#7513: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float64, UInt16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_29")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7514: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, UInt16, Float64> got.")
        }
        // logger.info("testcase TestCase_246 ends.")
    }

    @TestCase
    func TestCase_247(): Unit {
        // logger.info("testcase TestCase_247 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, UInt16, Int64>>().getStaticFunctions("classStaticMemberFunction_30").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_30")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt16, Int64>>(), [], [NonGenericStruct()])
            @Expect("assertion#7515: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_30")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#7516: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_30")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7517: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_30")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt16, Int64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7518: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_30")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt16, Int64>>(), [], [])
            @Expect("assertion#7519: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_30")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7520: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_30")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt16, Int64>>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7521: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_30")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7522: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_30")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt16, Int64>>(), [], [()])
            @Expect("assertion#7523: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_30")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7524: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Unit, UInt16, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_30")[0i64]
            .apply(TypeInfo.of<StandardClassType<Unit, UInt16, Int64>>(), [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_30")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#7525: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, UInt16, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_30")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt16, Int64>>(), [])
            @Expect("assertion#7526: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_30")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7527: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, UInt16, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_30")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt16, Int64>>(), [])
            @Expect("assertion#7528: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_30")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7529: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, UInt16, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_30")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt16, Int64>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7530: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_30")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7531: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, UInt16, Int64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_30")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt16, Int64>>(), [()])
            @Expect("assertion#7532: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_30")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7533: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, UInt16, Int64> got.")
        }
        // logger.info("testcase TestCase_247 ends.")
    }
}
