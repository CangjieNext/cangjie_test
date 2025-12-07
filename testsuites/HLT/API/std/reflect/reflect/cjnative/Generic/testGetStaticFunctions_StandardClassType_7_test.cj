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
class testGetStaticFunctions_StandardClassType_7 {
    @TestCase
    func TestCase_248(): Unit {
        // logger.info("testcase TestCase_248 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, Bool, Int64>>().getStaticFunctions("classStaticMemberFunction_31").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_31")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Int64>>(), [], [NonGenericStruct()])
            @Expect("assertion#7534: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_31")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#7535: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_31")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7536: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_31")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Int64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7537: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_31")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Int64>>(), [], [])
            @Expect("assertion#7538: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_31")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7539: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_31")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Int64>>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7540: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_31")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7541: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_31")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Int64>>(), [], [()])
            @Expect("assertion#7542: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_31")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7543: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt32, Bool, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_31")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Int64>>(), [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_31")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#7544: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Bool, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_31")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Int64>>(), [])
            @Expect("assertion#7545: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_31")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7546: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Bool, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_31")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Int64>>(), [])
            @Expect("assertion#7547: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_31")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7548: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Bool, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_31")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Int64>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7549: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_31")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7550: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Bool, Int64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_31")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Int64>>(), [()])
            @Expect("assertion#7551: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_31")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7552: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Bool, Int64> got.")
        }
        // logger.info("testcase TestCase_248 ends.")
    }

    @TestCase
    func TestCase_249(): Unit {
        // logger.info("testcase TestCase_249 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int8, Unit, Bool>>().getStaticFunctions("classStaticMemberFunction_32").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, Bool>>(), [], [NonGenericStruct()])
            @Expect("assertion#7553: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#7554: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7555: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, Bool>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7556: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, Bool>>(), [], [])
            @Expect("assertion#7557: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7558: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, Bool>>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7559: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7560: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, Bool>>(), [], [()])
            @Expect("assertion#7561: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7562: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int8, Unit, Bool>>()
            .getStaticFunctions("classStaticMemberFunction_32")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int8, Unit, Bool>>(), [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#7563: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, Unit, Bool> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, Bool>>(), [])
            @Expect("assertion#7564: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7565: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, Unit, Bool> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, Bool>>(), [])
            @Expect("assertion#7566: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7567: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, Unit, Bool> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, Bool>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7568: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7569: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, Unit, Bool> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, Unit, Bool>>(), [()])
            @Expect("assertion#7570: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, Unit, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_32")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7571: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, Unit, Bool> got.")
        }
        // logger.info("testcase TestCase_249 ends.")
    }

    @TestCase
    func TestCase_250(): Unit {
        // logger.info("testcase TestCase_250 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int8, UInt8, UInt32>>().getStaticFunctions("classStaticMemberFunction_33").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt8, UInt32>>(), [], [NonGenericStruct()])
            @Expect("assertion#7572: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#7573: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7574: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt8, UInt32>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7575: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt8, UInt32>>(), [], [])
            @Expect("assertion#7576: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7577: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt8, UInt32>>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7578: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7579: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt8, UInt32>>(), [], [()])
            @Expect("assertion#7580: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7581: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int8, UInt8, UInt32>>()
            .getStaticFunctions("classStaticMemberFunction_33")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int8, UInt8, UInt32>>(), [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#7582: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, UInt8, UInt32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt8, UInt32>>(), [])
            @Expect("assertion#7583: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7584: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, UInt8, UInt32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt8, UInt32>>(), [])
            @Expect("assertion#7585: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7586: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, UInt8, UInt32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt8, UInt32>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7587: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7588: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, UInt8, UInt32> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int8, UInt8, UInt32>>(), [()])
            @Expect("assertion#7589: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_33")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7590: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int8, UInt8, UInt32> got.")
        }
        // logger.info("testcase TestCase_250 ends.")
    }

    @TestCase
    func TestCase_251(): Unit {
        // logger.info("testcase TestCase_251 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Bool, Float32>>().getStaticFunctions("classStaticMemberFunction_34").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Float32>>(), [], [NonGenericStruct()])
            @Expect("assertion#7591: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#7592: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7593: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Float32>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7594: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Float32>>(), [], [])
            @Expect("assertion#7595: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7596: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Float32>>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7597: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7598: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Float32>>(), [], [()])
            @Expect("assertion#7599: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7600: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, Bool, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_34")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Float32>>(), [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#7601: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Bool, Float32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Float32>>(), [])
            @Expect("assertion#7602: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7603: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Bool, Float32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Float32>>(), [])
            @Expect("assertion#7604: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7605: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Bool, Float32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Float32>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7606: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#7607: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Bool, Float32> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Float32>>(), [()])
            @Expect("assertion#7608: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_34")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7609: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Bool, Float32> got.")
        }
        // logger.info("testcase TestCase_251 ends.")
    }

    @TestCase
    func TestCase_252(): Unit {
        // logger.info("testcase TestCase_252 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, Int32, Float64>>().getStaticFunctions("classStaticMemberFunction_35").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Int32, Float64>>(), [],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#7610: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#7611: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7612: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Int32, Float64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7613: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Int32, Float64>>(), [], [])
            @Expect("assertion#7614: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7615: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Int32, Float64>>(), [],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#7616: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#7617: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Int32, Float64>>(), [], [()])
            @Expect("assertion#7618: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#7619: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt16, Int32, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_35")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt16, Int32, Float64>>(), [GenericStructWith1TypeParameters<Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#7620: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Int32, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Int32, Float64>>(), [])
            @Expect("assertion#7621: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7622: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Int32, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Int32, Float64>>(), [])
            @Expect("assertion#7623: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7624: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Int32, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Int32, Float64>>(),
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#7625: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#7626: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Int32, Float64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Int32, Float64>>(), [()])
            @Expect("assertion#7627: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_35")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7628: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Int32, Float64> got.")
        }
        // logger.info("testcase TestCase_252 ends.")
    }
}
