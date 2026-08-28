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
class testGetStaticFunctions_StandardClassType_16 {
    @TestCase
    func TestCase_293(): Unit {
        // logger.info("testcase TestCase_293 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>().getStaticFunctions("classStaticMemberFunction_76").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt8, Unit, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_76")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                [GenericClassWith2TypeParameters<Unit, Unit>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8679: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Unit, Int8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8680: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Unit, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8681: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8682: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8683: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Unit, Int8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8684: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Unit, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8685: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#8686: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#8687: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt8, Unit, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8688: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8689: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#8690: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8691: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8692: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8693: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8694: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8695: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#8696: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8697: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8698: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8699: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(), [])
            @Expect("assertion#8700: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8701: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(), [])
            @Expect("assertion#8702: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8703: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8704: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8705: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt8, Unit, Int8>>(), [()])
            @Expect("assertion#8706: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt8, Unit, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_76")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8707: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_293 ends.")
    }
}
