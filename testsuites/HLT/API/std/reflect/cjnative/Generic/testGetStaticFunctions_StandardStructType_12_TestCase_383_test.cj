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
class testGetStaticFunctions_StandardStructType_12 {
    @TestCase
    func TestCase_383(): Unit {
        // logger.info("testcase TestCase_383 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>().getStaticFunctions("classStaticMemberFunction_166").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, UInt8, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_166")[0i64]
            .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [NonGenericClass()])
            @Expect("assertion#10839: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt8, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#10840: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt8, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#10841: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#10842: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10843: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt8, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10844: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt8, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10845: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#10846: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#10847: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, UInt8, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [NonGenericClass()])
            @Expect("assertion#10848: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#10849: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#10850: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10851: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#10852: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#10853: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10854: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10855: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#10856: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#10857: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(), [NonGenericClass()])
            @Expect("assertion#10858: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#10859: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(), [])
            @Expect("assertion#10860: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10861: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(), [])
            @Expect("assertion#10862: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10863: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10864: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10865: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, UInt8, Int32>>(), [()])
            @Expect("assertion#10866: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_166")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10867: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_383 ends.")
    }
}
