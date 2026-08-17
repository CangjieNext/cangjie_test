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
class testGetStaticFunctions_StandardClassType_21 {
    @TestCase
    func TestCase_320(): Unit {
        // logger.info("testcase TestCase_320 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, UInt8, Float32>>().getStaticFunctions("classStaticMemberFunction_103").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int64, UInt8, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_103")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int64, UInt8, Float32>>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                [GenericStructWith2TypeParameters<Unit, Unit>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#9462: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt8, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9463: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt8, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt8, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9464: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt8, Float32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#9465: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9466: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt8, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#9467: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt8, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt8, Float32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#9468: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt8, Float32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#9469: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#9470: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt8, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt8, Float32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#9471: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt8, Float32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#9472: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt8, Float32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#9473: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt8, Float32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9474: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt8, Float32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9475: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt8, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9476: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt8, Float32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#9477: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt8, Float32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#9478: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt8, Float32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#9479: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt8, Float32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9480: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt8, Float32>>(),
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#9481: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#9482: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt8, Float32>>(), [])
            @Expect("assertion#9483: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9484: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt8, Float32>>(), [])
            @Expect("assertion#9485: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9486: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt8, Float32>>(),
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#9487: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#9488: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt8, Float32>>(), [()])
            @Expect("assertion#9489: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_103")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9490: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_320 ends.")
    }
}
