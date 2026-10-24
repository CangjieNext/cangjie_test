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
    func TestCase_426(): Unit {
        // logger.info("testcase TestCase_426 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>().getStaticFunctions("classStaticMemberFunction_209").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int16, Int64, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_209")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()],
                [GenericStructWith1TypeParameters<UInt32>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<UInt32>()])
            @Expect("assertion#12086: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int16, Int64, UInt16>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#12087: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int16, Int64, UInt16>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#12088: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#12089: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12090: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int16, Int64, UInt16>'.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#12091: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int16, Int64, UInt16>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#12092: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#12093: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#12094: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid type info: expected 'Int64', got 'dependency.StandardStructType<Int16, Int64, UInt16>'.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [GenericStructWith1TypeParameters<UInt32>()])
            @Expect("assertion#12095: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt32>()])
            @Expect("assertion#12096: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#12097: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12098: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#12099: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#12100: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#12101: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#12102: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#12103: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12104: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(),
                    [GenericStructWith1TypeParameters<UInt32>()])
            @Expect("assertion#12105: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_209' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt32>()])
            @Expect("assertion#12106: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_209' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(), [])
            @Expect("assertion#12107: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_209' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12108: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_209' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(), [])
            @Expect("assertion#12109: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_209' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#12110: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_209' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(),
                    [GenericStructWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#12111: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_209' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#12112: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_209' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int16, Int64, UInt16>>(), [()])
            @Expect("assertion#12113: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_209' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int16, Int64, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_209")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#12114: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "Generic function 'classStaticMemberFunction_209' requires 'genericTypeArgs' to invoke.")
        }
        // logger.info("testcase TestCase_426 ends.")
    }
}
