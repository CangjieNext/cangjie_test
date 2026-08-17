/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1 
// DEPENDENCE: dependency
// EXEC: %compiler %cmp_opt %compile_library dependency/*.cj -o libdependency.%library_suffix
// EXEC: %compiler %cmp_opt -L. -ldependency %f %cmp_utest_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args  
package testsuite

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import std.reflect.*
import dependency.*

@Test
class testGetStaticFunctions_StandardStructType_18 {
    @TestCase
    func TestCase_416(): Unit {
        // logger.info("testcase TestCase_416 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>().getStaticFunctions("classStaticMemberFunction_199").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt8, Int16, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_199")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [NonGenericStruct()])
            @Expect("assertion#11796: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Int16, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#11797: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Int16, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#11798: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#11799: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11800: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Int16, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11801: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Int16, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11802: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#11803: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#11804: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt8, Int16, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#11805: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#11806: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#11807: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11808: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#11809: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#11810: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11811: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11812: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#11813: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11814: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(), [NonGenericStruct()])
            @Expect("assertion#11815: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#11816: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(), [])
            @Expect("assertion#11817: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11818: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(), [])
            @Expect("assertion#11819: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11820: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11821: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11822: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt8, Int16, Int32>>(), [()])
            @Expect("assertion#11823: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_199")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11824: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_416 ends.")
    }
}
