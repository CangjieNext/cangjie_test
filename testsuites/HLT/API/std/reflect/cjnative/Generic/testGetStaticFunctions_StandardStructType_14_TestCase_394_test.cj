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
class testGetStaticFunctions_StandardStructType_14 {
    @TestCase
    func TestCase_394(): Unit {
        // logger.info("testcase TestCase_394 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Int16, Int32>>().getStaticFunctions("classStaticMemberFunction_177").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, Int16, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_177")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()],
                [GenericClassWith1TypeParameters<Float64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#11158: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int16, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#11159: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int16, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#11160: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#11161: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11162: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int16, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#11163: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int16, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#11164: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#11165: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#11166: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int16, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#11167: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#11168: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#11169: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11170: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#11171: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#11172: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#11173: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#11174: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#11175: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11176: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#11177: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#11178: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(), [])
            @Expect("assertion#11179: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11180: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(), [])
            @Expect("assertion#11181: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11182: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#11183: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#11184: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(), [()])
            @Expect("assertion#11185: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11186: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_394 ends.")
    }
}
