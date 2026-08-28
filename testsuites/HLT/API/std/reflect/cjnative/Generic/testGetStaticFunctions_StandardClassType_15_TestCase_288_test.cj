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
    func TestCase_288(): Unit {
        // logger.info("testcase TestCase_288 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>().getStaticFunctions("classStaticMemberFunction_71").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt32, UInt32, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_71")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()],
                [GenericClassWith1TypeParameters<Float64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#8534: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt32, Int8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8535: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt32, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8536: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#8537: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8538: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt32, Int8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#8539: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt32, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#8540: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#8541: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#8542: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt32, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#8543: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#8544: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#8545: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8546: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8547: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#8548: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#8549: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#8550: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#8551: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8552: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#8553: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#8554: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(), [])
            @Expect("assertion#8555: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8556: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(), [])
            @Expect("assertion#8557: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8558: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(),
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#8559: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#8560: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt32, Int8>>(), [()])
            @Expect("assertion#8561: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_71")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8562: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_288 ends.")
    }
}
