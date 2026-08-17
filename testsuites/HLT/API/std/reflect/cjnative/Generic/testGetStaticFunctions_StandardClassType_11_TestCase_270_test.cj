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
class testGetStaticFunctions_StandardClassType_11 {
    @TestCase
    func TestCase_270(): Unit {
        // logger.info("testcase TestCase_270 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Bool, Int32, Int32>>().getStaticFunctions("classStaticMemberFunction_53").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Bool, Int32, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_53")[0i64]
            .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(),
                [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [1i8])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [1i8])
            @Expect("assertion#8012: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Int32, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8013: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Int32, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8014: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()],
                    [])
            @Expect("assertion#8015: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8016: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Int32, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [1i8, 114.514000f64])
            @Expect("assertion#8017: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Int32, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [1i8, 114.514000f64])
            @Expect("assertion#8018: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [114.514000f64])
            @Expect("assertion#8019: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [114.514000f64])
            @Expect("assertion#8020: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Bool, Int32, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()],
                    [1i8])
            @Expect("assertion#8021: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [1i8])
            @Expect("assertion#8022: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()],
                    [])
            @Expect("assertion#8023: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8024: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8025: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8026: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [1i8, 114.514000f64])
            @Expect("assertion#8027: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [1i8, 114.514000f64])
            @Expect("assertion#8028: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()],
                    [114.514000f64])
            @Expect("assertion#8029: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#8030: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(), [1i8])
            @Expect("assertion#8031: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i8])
            @Expect("assertion#8032: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(), [])
            @Expect("assertion#8033: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8034: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(), [])
            @Expect("assertion#8035: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8036: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(), [1i8, 114.514000f64])
            @Expect("assertion#8037: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<Int64>(), [1i8, 114.514000f64])
            @Expect("assertion#8038: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<StandardClassType<Bool, Int32, Int32>>(), [114.514000f64])
            @Expect("assertion#8039: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Bool, Int32, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_53")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#8040: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_270 ends.")
    }
}
