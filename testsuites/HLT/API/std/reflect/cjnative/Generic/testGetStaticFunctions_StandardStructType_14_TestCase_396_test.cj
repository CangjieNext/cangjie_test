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
class testGetStaticFunctions_StandardStructType_14 {
    @TestCase
    func TestCase_396(): Unit {
        // logger.info("testcase TestCase_396 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, Int64, Int64>>().getStaticFunctions("classStaticMemberFunction_179").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int16, Int64, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_179")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int16, Int64, Int64>>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>()],
                [GenericClassWith1TypeParameters<Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#11216: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Int64, Int64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#11217: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Int64, Int64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Int64>>(), [TypeInfo.of<Int8>(), TypeInfo.of<Bool>()],
                    [])
            @Expect("assertion#11218: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Int64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#11219: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11220: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Int64, Int64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11221: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Int64, Int64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Int64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11222: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Int64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#11223: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#11224: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int16, Int64, Int64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Int64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#11225: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Int64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#11226: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Int64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#11227: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Int64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11228: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Int64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#11229: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Int64>>(), [TypeInfo.of<Int8>(), TypeInfo.of<Bool>()],
                    [])
            @Expect("assertion#11230: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Int64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11231: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Int64>>(), [TypeInfo.of<Int8>(), TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11232: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Int64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#11233: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Int64>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11234: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Int64>>(),
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#11235: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#11236: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Int64>>(), [])
            @Expect("assertion#11237: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11238: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Int64>>(), [])
            @Expect("assertion#11239: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11240: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Int64>>(),
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11241: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11242: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, Int64>>(), [()])
            @Expect("assertion#11243: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_179")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11244: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_396 ends.")
    }
}
