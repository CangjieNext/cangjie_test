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
class testGetStaticFunctions_StandardClassType_20 {
    @TestCase
    func TestCase_317(): Unit {
        // logger.info("testcase TestCase_317 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>().getStaticFunctions("classStaticMemberFunction_100").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int16, UInt64, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_100")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()],
                [GenericStructWith1TypeParameters<UInt16>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#9375: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, UInt64, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9376: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, UInt64, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9377: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#9378: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9379: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, UInt64, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#9380: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, UInt64, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#9381: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#9382: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#9383: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, UInt64, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#9384: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#9385: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#9386: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9387: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9388: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9389: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#9390: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#9391: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#9392: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9393: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#9394: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#9395: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(), [])
            @Expect("assertion#9396: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9397: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(), [])
            @Expect("assertion#9398: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9399: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(),
                    [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#9400: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#9401: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, UInt64, Float32>>(), [()])
            @Expect("assertion#9402: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_100")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9403: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_317 ends.")
    }
}
