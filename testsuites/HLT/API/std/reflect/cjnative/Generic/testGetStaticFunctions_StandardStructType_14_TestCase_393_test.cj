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
    func TestCase_393(): Unit {
        // logger.info("testcase TestCase_393 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>().getStaticFunctions("classStaticMemberFunction_176").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float32, UInt32, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_176")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()],
                [GenericClassWith1TypeParameters<Unit>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#11129: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, UInt32, UInt16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11130: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, UInt32, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11131: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11132: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11133: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, UInt32, UInt16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#11134: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, UInt32, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#11135: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#11136: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#11137: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, UInt32, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#11138: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#11139: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11140: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11141: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11142: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11143: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#11144: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#11145: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#11146: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11147: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#11148: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#11149: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(), [])
            @Expect("assertion#11150: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11151: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(), [])
            @Expect("assertion#11152: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11153: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#11154: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#11155: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(), [()])
            @Expect("assertion#11156: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11157: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_393 ends.")
    }
}
