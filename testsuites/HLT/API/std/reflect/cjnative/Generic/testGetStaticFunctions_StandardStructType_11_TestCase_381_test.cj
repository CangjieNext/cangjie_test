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
class testGetStaticFunctions_StandardStructType_11 {
    @TestCase
    func TestCase_381(): Unit {
        // logger.info("testcase TestCase_381 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Int8, Int32>>().getStaticFunctions("classStaticMemberFunction_164").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, Int8, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_164")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#10781: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int8, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#10782: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int8, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#10783: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#10784: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10785: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int8, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [(), 114.514000f64])
            @Expect("assertion#10786: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int8, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [(), 114.514000f64])
            @Expect("assertion#10787: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [123i64])
            @Expect("assertion#10788: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [123i64])
            @Expect("assertion#10789: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int8, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#10790: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#10791: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#10792: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10793: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#10794: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#10795: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [(), 114.514000f64])
            @Expect("assertion#10796: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [(), 114.514000f64])
            @Expect("assertion#10797: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [123i64])
            @Expect("assertion#10798: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [123i64])
            @Expect("assertion#10799: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(), [()])
            @Expect("assertion#10800: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10801: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(), [])
            @Expect("assertion#10802: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10803: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(), [])
            @Expect("assertion#10804: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10805: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(), [(), 114.514000f64])
            @Expect("assertion#10806: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<Int64>(), [(), 114.514000f64])
            @Expect("assertion#10807: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int8, Int32>>(), [123i64])
            @Expect("assertion#10808: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_164")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64])
            @Expect("assertion#10809: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_381 ends.")
    }
}
