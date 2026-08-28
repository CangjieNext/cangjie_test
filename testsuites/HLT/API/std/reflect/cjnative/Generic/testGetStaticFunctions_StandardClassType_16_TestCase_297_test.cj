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
    func TestCase_297(): Unit {
        // logger.info("testcase TestCase_297 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>().getStaticFunctions("classStaticMemberFunction_80").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int32, UInt32, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_80")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Unit>()],
                [GenericClassWith2TypeParameters<Bool, Bool>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#8795: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, UInt32, Int8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8796: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, UInt32, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8797: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8798: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8799: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, UInt32, Int8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#8800: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, UInt32, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#8801: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#8802: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#8803: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int32, UInt32, Int8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#8804: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#8805: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8806: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8807: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#8808: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Unit>()],
                    [])
            @Expect("assertion#8809: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#8810: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#8811: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(), [TypeInfo.of<Bool>(), TypeInfo.of<Unit>()],
                    [()])
            @Expect("assertion#8812: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8813: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#8814: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#8815: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(), [])
            @Expect("assertion#8816: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8817: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(), [])
            @Expect("assertion#8818: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8819: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(),
                    [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#8820: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#8821: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int32, UInt32, Int8>>(), [()])
            @Expect("assertion#8822: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int32, UInt32, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_80")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8823: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_297 ends.")
    }
}
