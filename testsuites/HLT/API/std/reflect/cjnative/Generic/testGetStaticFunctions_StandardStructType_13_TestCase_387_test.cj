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
class testGetStaticFunctions_StandardStructType_13 {
    @TestCase
    func TestCase_387(): Unit {
        // logger.info("testcase TestCase_387 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>().getStaticFunctions("classStaticMemberFunction_170").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int16, UInt32, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_170")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [NonGenericClass()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [NonGenericClass()])
            @Expect("assertion#10955: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt32, Int8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#10956: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt32, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#10957: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#10958: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10959: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt32, Int8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10960: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt32, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10961: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#10962: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#10963: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, UInt32, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [NonGenericClass()])
            @Expect("assertion#10964: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#10965: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#10966: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10967: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#10968: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#10969: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10970: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10971: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#10972: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#10973: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(), [NonGenericClass()])
            @Expect("assertion#10974: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass()])
            @Expect("assertion#10975: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(), [])
            @Expect("assertion#10976: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10977: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(), [])
            @Expect("assertion#10978: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10979: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10980: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#10981: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, UInt32, Int8>>(), [()])
            @Expect("assertion#10982: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_170")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10983: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_387 ends.")
    }
}
