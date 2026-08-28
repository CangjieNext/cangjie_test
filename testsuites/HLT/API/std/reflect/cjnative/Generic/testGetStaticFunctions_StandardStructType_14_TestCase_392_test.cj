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
    func TestCase_392(): Unit {
        // logger.info("testcase TestCase_392 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>().getStaticFunctions("classStaticMemberFunction_175").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int32, Int16, UInt32>>()
            .getStaticFunctions("classStaticMemberFunction_175")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                [GenericClassWith1TypeParameters<Bool>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#11100: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Int16, UInt32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11101: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Int16, UInt32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11102: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11103: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11104: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Int16, UInt32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#11105: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Int16, UInt32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#11106: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11107: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11108: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Int16, UInt32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#11109: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#11110: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11111: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11112: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11113: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11114: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#11115: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#11116: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#11117: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11118: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#11119: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#11120: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(), [])
            @Expect("assertion#11121: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11122: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(), [])
            @Expect("assertion#11123: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11124: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#11125: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#11126: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(), [()])
            @Expect("assertion#11127: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11128: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_392 ends.")
    }
}
