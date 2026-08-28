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
class testGetStaticFunctions_StandardStructType_17 {
    @TestCase
    func TestCase_409(): Unit {
        // logger.info("testcase TestCase_409 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>().getStaticFunctions("classStaticMemberFunction_192").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Unit, Int64, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_192")[0i64]
            .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [NonGenericStruct()])
            @Expect("assertion#11593: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Int64, UInt16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11594: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Int64, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11595: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#11596: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11597: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Int64, UInt16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11598: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Int64, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11599: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#11600: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#11601: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Unit, Int64, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [NonGenericStruct()])
            @Expect("assertion#11602: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#11603: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#11604: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11605: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11606: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11607: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11608: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Unit>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11609: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#11610: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11611: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(), [NonGenericStruct()])
            @Expect("assertion#11612: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#11613: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(), [])
            @Expect("assertion#11614: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11615: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(), [])
            @Expect("assertion#11616: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11617: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11618: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#11619: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<StandardStructType<Unit, Int64, UInt16>>(), [()])
            @Expect("assertion#11620: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_192")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11621: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_409 ends.")
    }
}
