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
class testGetStaticFunctions_StandardStructType_22 {
    @TestCase
    func TestCase_432(): Unit {
        // logger.info("testcase TestCase_432 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt64, Int32, UInt8>>().getStaticFunctions("classStaticMemberFunction_215").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt64, Int32, UInt8>>()
            .getStaticFunctions("classStaticMemberFunction_215")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt64, Int32, UInt8>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()],
                [GenericStructWith2TypeParameters<UInt8, UInt8>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#12260: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Int32, UInt8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#12261: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Int32, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int32, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#12262: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int32, UInt8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#12263: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12264: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Int32, UInt8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#12265: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Int32, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int32, UInt8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#12266: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int32, UInt8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#12267: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#12268: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt64, Int32, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int32, UInt8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#12269: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int32, UInt8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#12270: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int32, UInt8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#12271: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int32, UInt8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12272: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int32, UInt8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#12273: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int32, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#12274: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int32, UInt8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#12275: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int32, UInt8>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#12276: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int32, UInt8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#12277: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int32, UInt8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12278: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int32, UInt8>>(),
                    [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#12279: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#12280: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int32, UInt8>>(), [])
            @Expect("assertion#12281: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12282: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int32, UInt8>>(), [])
            @Expect("assertion#12283: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12284: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int32, UInt8>>(),
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#12285: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#12286: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt64, Int32, UInt8>>(), [()])
            @Expect("assertion#12287: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int32, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_215")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#12288: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_432 ends.")
    }
}
