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
class testGetStaticFunctions_StandardStructType_7 {
    @TestCase
    func TestCase_357(): Unit {
        // logger.info("testcase TestCase_357 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, UInt64, Int64>>().getStaticFunctions("classStaticMemberFunction_140").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_140")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, Int64>>(), [], [NonGenericStruct()])
            @Expect("assertion#10245: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_140")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#10246: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_140")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10247: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_140")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, Int64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10248: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_140")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, Int64>>(), [], [])
            @Expect("assertion#10249: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_140")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10250: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_140")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, Int64>>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10251: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_140")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10252: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_140")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, Int64>>(), [], [()])
            @Expect("assertion#10253: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_140")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10254: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int16, UInt64, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_140")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int16, UInt64, Int64>>(), [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_140")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#10255: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt64, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_140")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, Int64>>(), [])
            @Expect("assertion#10256: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_140")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10257: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt64, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_140")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, Int64>>(), [])
            @Expect("assertion#10258: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_140")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10259: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt64, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_140")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, Int64>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10260: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_140")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10261: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt64, Int64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_140")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt64, Int64>>(), [()])
            @Expect("assertion#10262: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_140")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10263: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt64, Int64> got.")
        }
        // logger.info("testcase TestCase_357 ends.")
    }

    @TestCase
    func TestCase_358(): Unit {
        // logger.info("testcase TestCase_358 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, Unit, Int64>>().getStaticFunctions("classStaticMemberFunction_141").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_141")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Unit, Int64>>(), [], [NonGenericStruct()])
            @Expect("assertion#10264: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_141")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#10265: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_141")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10266: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_141")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Unit, Int64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10267: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_141")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Unit, Int64>>(), [], [])
            @Expect("assertion#10268: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_141")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10269: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_141")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Unit, Int64>>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10270: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_141")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10271: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_141")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Unit, Int64>>(), [], [()])
            @Expect("assertion#10272: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_141")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10273: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, Unit, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_141")[0i64]
            .apply(TypeInfo.of<StandardStructType<Bool, Unit, Int64>>(), [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_141")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#10274: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Unit, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_141")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Unit, Int64>>(), [])
            @Expect("assertion#10275: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_141")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10276: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Unit, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_141")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Unit, Int64>>(), [])
            @Expect("assertion#10277: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_141")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10278: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Unit, Int64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_141")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Unit, Int64>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10279: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_141")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10280: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Unit, Int64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_141")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Unit, Int64>>(), [()])
            @Expect("assertion#10281: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_141")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10282: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Unit, Int64> got.")
        }
        // logger.info("testcase TestCase_358 ends.")
    }

    @TestCase
    func TestCase_359(): Unit {
        // logger.info("testcase TestCase_359 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, Bool, Float32>>().getStaticFunctions("classStaticMemberFunction_142").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float32>>(), [], [NonGenericStruct()])
            @Expect("assertion#10283: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#10284: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10285: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float32>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10286: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float32>>(), [], [])
            @Expect("assertion#10287: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10288: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float32>>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10289: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10290: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float32>>(), [], [()])
            @Expect("assertion#10291: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10292: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt16, Bool, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_142")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float32>>(), [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#10293: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Bool, Float32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float32>>(), [])
            @Expect("assertion#10294: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10295: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Bool, Float32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float32>>(), [])
            @Expect("assertion#10296: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10297: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Bool, Float32> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float32>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10298: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10299: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Bool, Float32> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Bool, Float32>>(), [()])
            @Expect("assertion#10300: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Bool, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_142")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10301: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Bool, Float32> got.")
        }
        // logger.info("testcase TestCase_359 ends.")
    }

    @TestCase
    func TestCase_360(): Unit {
        // logger.info("testcase TestCase_360 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, Int16, Float64>>().getStaticFunctions("classStaticMemberFunction_143").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_143")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Float64>>(), [], [NonGenericStruct()])
            @Expect("assertion#10302: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_143")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#10303: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_143")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10304: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_143")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Float64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10305: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_143")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Float64>>(), [], [])
            @Expect("assertion#10306: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_143")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10307: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_143")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Float64>>(), [], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10308: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_143")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10309: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_143")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Float64>>(), [], [()])
            @Expect("assertion#10310: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_143")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10311: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt16, Int16, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_143")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Float64>>(), [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_143")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#10312: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int16, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_143")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Float64>>(), [])
            @Expect("assertion#10313: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_143")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10314: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int16, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_143")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Float64>>(), [])
            @Expect("assertion#10315: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_143")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10316: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int16, Float64> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_143")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Float64>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10317: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_143")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#10318: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int16, Float64> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_143")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt16, Int16, Float64>>(), [()])
            @Expect("assertion#10319: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Int16, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_143")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10320: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt16, Int16, Float64> got.")
        }
        // logger.info("testcase TestCase_360 ends.")
    }

    @TestCase
    func TestCase_361(): Unit {
        // logger.info("testcase TestCase_361 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, Unit, UInt8>>().getStaticFunctions("classStaticMemberFunction_144").size)
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt8>>(), [],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#10321: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#10322: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#10323: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt8>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10324: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt8>>(), [], [])
            @Expect("assertion#10325: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#10326: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt8>>(), [],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#10327: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#10328: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt8>>(), [], [()])
            @Expect("assertion#10329: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#10330: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int32, Unit, UInt8>>()
            .getStaticFunctions("classStaticMemberFunction_144")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt8>>(), [GenericStructWith1TypeParameters<Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#10331: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Unit, UInt8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt8>>(), [])
            @Expect("assertion#10332: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10333: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Unit, UInt8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt8>>(), [])
            @Expect("assertion#10334: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10335: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Unit, UInt8> got.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt8>>(),
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#10336: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#10337: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Unit, UInt8> got.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Unit, UInt8>>(), [()])
            @Expect("assertion#10338: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_144")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10339: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Unit, UInt8> got.")
        }
        // logger.info("testcase TestCase_361 ends.")
    }
}
