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
class testGetStaticFunctions_StandardStructType_19 {
    @TestCase
    func TestCase_418(): Unit {
        // logger.info("testcase TestCase_418 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>().getStaticFunctions("classStaticMemberFunction_201").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt32, UInt16, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_201")[0i64]
            .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                [GenericStructWith1TypeParameters<Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#11854: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt16, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11855: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt16, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11856: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#11857: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11858: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt16, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11859: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt16, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11860: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#11861: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#11862: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<UInt32, UInt16, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#11863: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#11864: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#11865: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11866: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11867: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11868: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11869: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11870: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#11871: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11872: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#11873: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#11874: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(), [])
            @Expect("assertion#11875: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11876: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(), [])
            @Expect("assertion#11877: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11878: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(),
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11879: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11880: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<StandardStructType<UInt32, UInt16, Unit>>(), [()])
            @Expect("assertion#11881: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, UInt16, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_201")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11882: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_418 ends.")
    }
}
