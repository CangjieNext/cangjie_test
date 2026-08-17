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
    func TestCase_272(): Unit {
        // logger.info("testcase TestCase_272 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Int32, Unit>>().getStaticFunctions("classStaticMemberFunction_55").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Float32, Int32, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_55")[0i64]
            .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [114.514000f64])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [114.514000f64])
            @Expect("assertion#8070: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Int32, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8071: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Int32, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8072: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#8073: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8074: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Int32, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float64>(), TypeInfo.of<Int32>()],
                    [114.514000f64, 114.514000f64])
            @Expect("assertion#8075: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Int32, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, 114.514000f64])
            @Expect("assertion#8076: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8077: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8078: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float32, Int32, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [114.514000f64])
            @Expect("assertion#8079: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#8080: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#8081: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8082: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8083: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8084: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [114.514000f64, 114.514000f64])
            @Expect("assertion#8085: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [114.514000f64, 114.514000f64])
            @Expect("assertion#8086: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#8087: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8088: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(), [114.514000f64])
            @Expect("assertion#8089: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#8090: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(), [])
            @Expect("assertion#8091: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8092: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(), [])
            @Expect("assertion#8093: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8094: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(), [114.514000f64, 114.514000f64])
            @Expect("assertion#8095: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64, 114.514000f64])
            @Expect("assertion#8096: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float32, Int32, Unit>>(), [()])
            @Expect("assertion#8097: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int32, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_55")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8098: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_272 ends.")
    }
}
