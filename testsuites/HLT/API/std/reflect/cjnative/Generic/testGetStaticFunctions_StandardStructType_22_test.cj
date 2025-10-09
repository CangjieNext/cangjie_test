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

    @TestCase
    func TestCase_433(): Unit {
        // logger.info("testcase TestCase_433 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>().getStaticFunctions("classStaticMemberFunction_216").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Unit, UInt16, Bool>>()
            .getStaticFunctions("classStaticMemberFunction_216")[0i64]
            .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                [GenericStructWith2TypeParameters<UInt8, UInt8>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#12289: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt16, Bool> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12290: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt16, Bool> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12291: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#12292: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12293: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt16, Bool> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#12294: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt16, Bool> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#12295: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12296: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12297: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, UInt16, Bool> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#12298: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#12299: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#12300: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12301: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12302: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12303: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#12304: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#12305: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#12306: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12307: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#12308: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#12309: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(), [])
            @Expect("assertion#12310: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12311: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(), [])
            @Expect("assertion#12312: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12313: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(),
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#12314: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#12315: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, UInt16, Bool>>(), [()])
            @Expect("assertion#12316: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt16, Bool>>()
                .getStaticFunctions("classStaticMemberFunction_216")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#12317: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_433 ends.")
    }

    @TestCase
    func TestCase_434(): Unit {
        // logger.info("testcase TestCase_434 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Float64, Unit>>().getStaticFunctions("classStaticMemberFunction_217").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, Float64, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_217")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float64, Float64, Unit>>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                [GenericStructWith2TypeParameters<Int32, Int32>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#12318: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Float64, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#12319: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Float64, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Unit>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#12320: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Unit>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#12321: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12322: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Float64, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12323: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Float64, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Unit>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12324: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Unit>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#12325: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#12326: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Float64, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Unit>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#12327: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Unit>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#12328: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Unit>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#12329: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Unit>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12330: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Unit>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#12331: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Unit>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#12332: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Unit>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12333: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Unit>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12334: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Unit>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#12335: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Unit>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12336: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Unit>>(),
                    [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#12337: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#12338: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Unit>>(), [])
            @Expect("assertion#12339: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12340: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Unit>>(), [])
            @Expect("assertion#12341: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12342: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Unit>>(),
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12343: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12344: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Float64, Unit>>(), [()])
            @Expect("assertion#12345: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_217")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#12346: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_434 ends.")
    }

    @TestCase
    func TestCase_435(): Unit {
        // logger.info("testcase TestCase_435 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int8, Int32, Float32>>().getStaticFunctions("classStaticMemberFunction_218").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int8, Int32, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_218")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>()],
                [GenericStructWith2TypeParameters<Int32, Int32>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#12347: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Int32, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#12348: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Int32, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#12349: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#12350: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12351: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Int32, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12352: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Int32, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12353: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#12354: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#12355: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, Int32, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#12356: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#12357: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#12358: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12359: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#12360: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#12361: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12362: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12363: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#12364: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12365: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#12366: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#12367: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(), [])
            @Expect("assertion#12368: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12369: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(), [])
            @Expect("assertion#12370: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12371: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(),
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12372: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#12373: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, Int32, Float32>>(), [()])
            @Expect("assertion#12374: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, Int32, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_218")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#12375: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_435 ends.")
    }
}
