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
class testGetStaticFunctions_StandardStructType_20 {
    @TestCase
    func TestCase_422(): Unit {
        // logger.info("testcase TestCase_422 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, UInt64, Int16>>().getStaticFunctions("classStaticMemberFunction_205").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int32, UInt64, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_205")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int32, UInt64, Int16>>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                [GenericStructWith1TypeParameters<UInt64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#11970: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, UInt64, Int16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11971: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, UInt64, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt64, Int16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11972: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt64, Int16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11973: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11974: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, UInt64, Int16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#11975: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, UInt64, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt64, Int16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#11976: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt64, Int16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11977: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11978: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, UInt64, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt64, Int16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>()], [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#11979: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt64, Int16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#11980: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt64, Int16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11981: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt64, Int16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11982: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt64, Int16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11983: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt64, Int16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11984: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt64, Int16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#11985: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt64, Int16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#11986: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt64, Int16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#11987: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt64, Int16>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#11988: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt64, Int16>>(),
                    [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#11989: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#11990: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt64, Int16>>(), [])
            @Expect("assertion#11991: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11992: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt64, Int16>>(), [])
            @Expect("assertion#11993: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11994: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt64, Int16>>(),
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#11995: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#11996: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, UInt64, Int16>>(), [()])
            @Expect("assertion#11997: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, UInt64, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_205")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11998: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_422 ends.")
    }
}
