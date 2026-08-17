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
class testGetStaticFunctions_StandardStructType_18 {
    @TestCase
    func TestCase_414(): Unit {
        // logger.info("testcase TestCase_414 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>().getStaticFunctions("classStaticMemberFunction_197").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int8, UInt64, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_197")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [NonGenericStruct()])
            @Expect("assertion#11738: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, UInt64, UInt16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11739: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, UInt64, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11740: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#11741: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11742: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, UInt64, UInt16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11743: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, UInt64, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11744: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#11745: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#11746: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int8, UInt64, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [NonGenericStruct()])
            @Expect("assertion#11747: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#11748: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#11749: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11750: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11751: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11752: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int32>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11753: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11754: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#11755: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11756: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(), [NonGenericStruct()])
            @Expect("assertion#11757: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#11758: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(), [])
            @Expect("assertion#11759: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11760: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(), [])
            @Expect("assertion#11761: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11762: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11763: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11764: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int8, UInt64, UInt16>>(), [()])
            @Expect("assertion#11765: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int8, UInt64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_197")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11766: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_414 ends.")
    }
}
