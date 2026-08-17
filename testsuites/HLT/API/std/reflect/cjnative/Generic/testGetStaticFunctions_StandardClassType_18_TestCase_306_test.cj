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
class testGetStaticFunctions_StandardClassType_18 {
    @TestCase
    func TestCase_306(): Unit {
        // logger.info("testcase TestCase_306 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>().getStaticFunctions("classStaticMemberFunction_89").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float32, UInt8, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_89")[0i64]
            .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [NonGenericStruct()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [NonGenericStruct()])
            @Expect("assertion#9056: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, UInt8, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9057: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, UInt8, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9058: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#9059: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9060: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, UInt8, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9061: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, UInt8, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9062: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#9063: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#9064: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, UInt8, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [NonGenericStruct()])
            @Expect("assertion#9065: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#9066: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#9067: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9068: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9069: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9070: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9071: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9072: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#9073: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9074: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(), [NonGenericStruct()])
            @Expect("assertion#9075: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct()])
            @Expect("assertion#9076: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(), [])
            @Expect("assertion#9077: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9078: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(), [])
            @Expect("assertion#9079: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9080: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9081: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<Int64>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#9082: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, UInt8, Int32>>(), [()])
            @Expect("assertion#9083: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, UInt8, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_89")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9084: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_306 ends.")
    }
}
