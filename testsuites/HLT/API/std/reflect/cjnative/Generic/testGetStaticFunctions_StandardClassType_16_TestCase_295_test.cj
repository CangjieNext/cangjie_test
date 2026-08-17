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
class testGetStaticFunctions_StandardClassType_16 {
    @TestCase
    func TestCase_295(): Unit {
        // logger.info("testcase TestCase_295 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>().getStaticFunctions("classStaticMemberFunction_78").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, Unit, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_78")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>()],
                [GenericClassWith2TypeParameters<Unit, Unit>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8737: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Unit, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#8738: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Unit, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Bool>()],
                    [])
            @Expect("assertion#8739: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(), [TypeInfo.of<Int16>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8740: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8741: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Unit, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8742: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Unit, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8743: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#8744: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#8745: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Unit, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(), [TypeInfo.of<Int16>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8746: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8747: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(), [TypeInfo.of<Int16>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8748: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8749: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#8750: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Bool>()],
                    [])
            @Expect("assertion#8751: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8752: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8753: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(), [TypeInfo.of<Int16>(), TypeInfo.of<Unit>()],
                    [()])
            @Expect("assertion#8754: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8755: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8756: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#8757: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(), [])
            @Expect("assertion#8758: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8759: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(), [])
            @Expect("assertion#8760: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8761: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8762: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#8763: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(), [()])
            @Expect("assertion#8764: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_78")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8765: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_295 ends.")
    }
}
