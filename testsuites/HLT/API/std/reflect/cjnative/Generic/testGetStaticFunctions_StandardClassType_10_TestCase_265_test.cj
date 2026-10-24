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
class testGetStaticFunctions_StandardClassType_10 {
    @TestCase
    func TestCase_265(): Unit {
        // logger.info("testcase TestCase_265 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>().getStaticFunctions("classStaticMemberFunction_48").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt16, Unit, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_48")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [true])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [true])
            @Expect("assertion#7867: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt16, Unit, Int64>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#7868: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt16, Unit, Int64>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()],
                    [])
            @Expect("assertion#7869: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#7870: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#7871: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt16, Unit, Int64>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [true, 114.514000f64])
            @Expect("assertion#7872: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt16, Unit, Int64>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [true, 114.514000f64])
            @Expect("assertion#7873: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#7874: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#7875: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardClassType<UInt16, Unit, Int64>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [true])
            @Expect("assertion#7876: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [true])
            @Expect("assertion#7877: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#7878: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#7879: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#7880: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()],
                    [])
            @Expect("assertion#7881: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>()], [true, 114.514000f64])
            @Expect("assertion#7882: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int32>()],
                    [true, 114.514000f64])
            @Expect("assertion#7883: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#7884: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int8>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#7885: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(), [true])
            @Expect("assertion#7886: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_48' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<Int64>(), [true])
            @Expect("assertion#7887: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_48' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(), [])
            @Expect("assertion#7888: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_48' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7889: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_48' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(), [])
            @Expect("assertion#7890: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_48' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7891: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_48' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(), [true, 114.514000f64])
            @Expect("assertion#7892: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_48' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<Int64>(), [true, 114.514000f64])
            @Expect("assertion#7893: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_48' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Unit, Int64>>(), [()])
            @Expect("assertion#7894: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_48' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Unit, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_48")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#7895: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_48' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_265 ends.")
    }
}
