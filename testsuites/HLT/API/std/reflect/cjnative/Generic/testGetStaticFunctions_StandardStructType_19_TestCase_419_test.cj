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
    func TestCase_419(): Unit {
        // logger.info("testcase TestCase_419 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, Int64, Float32>>().getStaticFunctions("classStaticMemberFunction_202").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int64, Int64, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_202")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                [GenericStructWith1TypeParameters<Bool>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#11883: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int64, Int64, Float32>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11884: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int64, Int64, Float32>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11885: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11886: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11887: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int64, Int64, Float32>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#11888: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int64, Int64, Float32>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#11889: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#11890: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#11891: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int64, Int64, Float32>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#11892: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#11893: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#11894: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11895: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11896: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11897: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#11898: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#11899: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#11900: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11901: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#11902: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_202' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#11903: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_202' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(), [])
            @Expect("assertion#11904: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_202' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11905: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_202' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(), [])
            @Expect("assertion#11906: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_202' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11907: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_202' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(),
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#11908: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_202' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#11909: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_202' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int64, Int64, Float32>>(), [()])
            @Expect("assertion#11910: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_202' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_202")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11911: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_202' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_419 ends.")
    }
}
