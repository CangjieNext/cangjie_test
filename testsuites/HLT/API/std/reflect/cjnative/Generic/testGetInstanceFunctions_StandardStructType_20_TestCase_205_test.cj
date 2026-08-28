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
class testGetInstanceFunctions_StandardStructType_20 {
    @TestCase
    func TestCase_205(): Unit {
        // logger.info("testcase TestCase_205 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, Float32, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_206").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, Float32, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
            .apply(StandardStructType<Bool, Float32, UInt8>(),
                [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                [GenericStructWith1TypeParameters<UInt8>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#6512: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#6513: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6514: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6515: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6516: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6517: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#6518: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6519: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply("hello", [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#6520: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#6521: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#6522: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#6523: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(1i64, [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#6524: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#6525: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#6526: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#6527: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#6528: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#6529: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6530: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(), [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#6531: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#6532: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#6533: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(), [])
            @Expect("assertion#6534: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6535: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply("hello", [])
            @Expect("assertion#6536: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(), [])
            @Expect("assertion#6537: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6538: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply("hello", [])
            @Expect("assertion#6539: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(),
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#6540: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#6541: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#6542: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(StandardStructType<Bool, Float32, UInt8>(), [()])
            @Expect("assertion#6543: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6544: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Float32, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_206")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6545: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_205 ends.")
    }
}
