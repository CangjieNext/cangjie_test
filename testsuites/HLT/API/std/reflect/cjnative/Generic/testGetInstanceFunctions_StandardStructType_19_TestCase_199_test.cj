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
class testGetInstanceFunctions_StandardStructType_19 {
    @TestCase
    func TestCase_199(): Unit {
        // logger.info("testcase TestCase_199 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, Int16, Int32>>().getInstanceFunctions("classInstanceMemberFunction_200").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, Int16, Int32>>()
            .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
            .apply(StandardStructType<Bool, Int16, Int32>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [NonGenericStruct()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#6308: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [NonGenericStruct()])
            @Expect("assertion#6309: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#6310: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(), [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#6311: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply("hello",
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6312: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#6313: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#6314: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6315: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6316: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6317: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6318: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#6319: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#6320: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#6321: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#6322: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#6323: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(), [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#6324: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6325: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6326: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(), [NonGenericStruct()])
            @Expect("assertion#6327: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#6328: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#6329: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(), [])
            @Expect("assertion#6330: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6331: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply("hello", [])
            @Expect("assertion#6332: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(), [])
            @Expect("assertion#6333: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6334: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply("hello", [])
            @Expect("assertion#6335: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6336: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6337: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6338: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(), [()])
            @Expect("assertion#6339: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6340: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6341: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_199 ends.")
    }
}
