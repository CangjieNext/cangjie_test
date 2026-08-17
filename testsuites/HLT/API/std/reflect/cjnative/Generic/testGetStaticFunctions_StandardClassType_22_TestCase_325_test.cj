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
class testGetStaticFunctions_StandardClassType_22 {
    @TestCase
    func TestCase_325(): Unit {
        // logger.info("testcase TestCase_325 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, Int8, Float32>>().getStaticFunctions("classStaticMemberFunction_108").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int16, Int8, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_108")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float32>>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()],
                [GenericStructWith2TypeParameters<Bool, Bool>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#9607: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int8, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9608: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int8, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9609: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float32>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Bool>()],
                    [])
            @Expect("assertion#9610: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9611: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int8, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Bool>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#9612: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int8, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#9613: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#9614: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#9615: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int8, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float32>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Bool>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#9616: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#9617: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float32>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Bool>()],
                    [])
            @Expect("assertion#9618: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9619: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9620: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#9621: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#9622: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#9623: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float32>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Bool>()],
                    [()])
            @Expect("assertion#9624: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9625: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float32>>(),
                    [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#9626: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#9627: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float32>>(), [])
            @Expect("assertion#9628: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9629: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float32>>(), [])
            @Expect("assertion#9630: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9631: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float32>>(),
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#9632: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#9633: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float32>>(), [()])
            @Expect("assertion#9634: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_108")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9635: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_325 ends.")
    }
}
