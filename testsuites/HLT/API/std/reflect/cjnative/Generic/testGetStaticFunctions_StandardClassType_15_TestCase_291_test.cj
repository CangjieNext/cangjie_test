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
class testGetStaticFunctions_StandardClassType_15 {
    @TestCase
    func TestCase_291(): Unit {
        // logger.info("testcase TestCase_291 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>().getStaticFunctions("classStaticMemberFunction_74").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt32, Unit, UInt8>>()
            .getStaticFunctions("classStaticMemberFunction_74")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()],
                [GenericClassWith2TypeParameters<Int64, Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#8621: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Unit, UInt8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8622: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Unit, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8623: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8624: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8625: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Unit, UInt8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#8626: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Unit, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#8627: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#8628: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#8629: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Unit, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#8630: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#8631: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8632: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8633: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8634: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8635: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#8636: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#8637: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Unit>()],
                    [()])
            @Expect("assertion#8638: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8639: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(),
                    [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#8640: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#8641: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(), [])
            @Expect("assertion#8642: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8643: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(), [])
            @Expect("assertion#8644: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8645: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(),
                    [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#8646: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#8647: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Unit, UInt8>>(), [()])
            @Expect("assertion#8648: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Unit, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_74")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8649: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_291 ends.")
    }
}
