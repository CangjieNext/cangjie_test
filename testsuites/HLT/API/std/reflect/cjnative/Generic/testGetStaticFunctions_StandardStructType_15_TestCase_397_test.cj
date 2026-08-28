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
class testGetStaticFunctions_StandardStructType_15 {
    @TestCase
    func TestCase_397(): Unit {
        // logger.info("testcase TestCase_397 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, Int8, Float32>>().getStaticFunctions("classStaticMemberFunction_180").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float32, Int8, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_180")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>()],
                [GenericClassWith1TypeParameters<Float32>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()],
                    [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#11245: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int8, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#11246: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int8, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#11247: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11248: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11249: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int8, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#11250: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int8, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#11251: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#11252: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#11253: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, Int8, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#11254: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#11255: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11256: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11257: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#11258: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#11259: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>()],
                    [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#11260: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Int64>()],
                    [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#11261: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#11262: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11263: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#11264: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#11265: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(), [])
            @Expect("assertion#11266: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11267: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(), [])
            @Expect("assertion#11268: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11269: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(),
                    [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#11270: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#11271: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, Int8, Float32>>(), [()])
            @Expect("assertion#11272: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_180")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11273: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_397 ends.")
    }
}
