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
class testGetStaticFunctions_StandardStructType_17 {
    @TestCase
    func TestCase_410(): Unit {
        // logger.info("testcase TestCase_410 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>().getStaticFunctions("classStaticMemberFunction_193").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int32, Int8, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_193")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [NonGenericStruct()])
            @Expect("assertion#11622: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Int8, UInt16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#11623: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Int8, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#11624: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11625: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11626: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Int8, UInt16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11627: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Int8, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11628: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#11629: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#11630: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Int8, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>()], [NonGenericStruct()])
            @Expect("assertion#11631: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#11632: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11633: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11634: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#11635: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#11636: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11637: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11638: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#11639: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11640: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(), [NonGenericStruct()])
            @Expect("assertion#11641: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#11642: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(), [])
            @Expect("assertion#11643: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11644: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(), [])
            @Expect("assertion#11645: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11646: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11647: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11648: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int8, UInt16>>(), [()])
            @Expect("assertion#11649: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int8, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_193")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11650: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_410 ends.")
    }
}
