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
class testGetStaticFunctions_StandardClassType_14 {
    @TestCase
    func TestCase_286(): Unit {
        // logger.info("testcase TestCase_286 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>().getStaticFunctions("classStaticMemberFunction_69").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int16, Int64, UInt8>>()
            .getStaticFunctions("classStaticMemberFunction_69")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(),
                [TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>()],
                [GenericClassWith1TypeParameters<Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#8476: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int64, UInt8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#8477: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int64, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(), [TypeInfo.of<Int8>(), TypeInfo.of<Bool>()],
                    [])
            @Expect("assertion#8478: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int8>()],
                    [])
            @Expect("assertion#8479: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8480: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int64, UInt8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#8481: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int64, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#8482: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#8483: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#8484: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int64, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#8485: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#8486: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int8>()],
                    [])
            @Expect("assertion#8487: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8488: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#8489: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(), [TypeInfo.of<Int8>(), TypeInfo.of<Bool>()],
                    [])
            @Expect("assertion#8490: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#8491: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(), [TypeInfo.of<Int8>(), TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#8492: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int8>()],
                    [()])
            @Expect("assertion#8493: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8494: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(), [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#8495: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#8496: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(), [])
            @Expect("assertion#8497: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8498: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(), [])
            @Expect("assertion#8499: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8500: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(),
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#8501: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#8502: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(), [()])
            @Expect("assertion#8503: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8504: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_286 ends.")
    }
}
