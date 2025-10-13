/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1 
// DEPENDENCE: dependency
// (not MAC) EXEC: cd dependency && %compiler %cmp_opt --output-type=dylib  *.cj -o libdependency.%test_suffix
// (not MAC) EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output --import-path . -L dependency -ldependency
// (not MAC) RUN-EXEC: %cp ./dependency/libdependency.%test_suffix .&& %run %run_opt %output %run_utest_opt %run_args  
package testsuite

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import std.reflect.*
import dependency.*

@Test
class testGetInstanceFunctions_StandardClassType_12 {
    @TestCase
    func TestCase_55(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Unit, Int32>>().getInstanceFunctions("classInstanceMemberFunction_56").size)
        TypeInfo
            .of<StandardClassType<Float32, Unit, Int32>>()
            .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
            .apply(StandardClassType<Float32, Unit, Int32>(),
                [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [NonGenericClass()])
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [NonGenericClass()])
            @Expect("assertion#1641: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [NonGenericClass()])
            @Expect("assertion#1642: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#1643: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply(StandardClassType<Float32, Unit, Int32>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#1644: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply("hello",
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1645: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#1646: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply(StandardClassType<Float32, Unit, Int32>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#1647: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#1648: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply("hello", [TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1649: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply(1i64, [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1650: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply(StandardClassType<Float32, Unit, Int32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1651: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply(StandardClassType<Float32, Unit, Int32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#1652: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply(1i64, [TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#1653: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply("hello", [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#1654: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply(StandardClassType<Float32, Unit, Int32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#1655: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply(StandardClassType<Float32, Unit, Int32>(), [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#1656: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply(StandardClassType<Float32, Unit, Int32>(), [TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#1657: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply(StandardClassType<Float32, Unit, Int32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1658: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply(StandardClassType<Float32, Unit, Int32>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1659: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply(StandardClassType<Float32, Unit, Int32>(), [NonGenericClass()])
            @Expect("assertion#1660: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#1661: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#1662: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply(StandardClassType<Float32, Unit, Int32>(), [])
            @Expect("assertion#1663: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1664: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply("hello", [])
            @Expect("assertion#1665: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply(StandardClassType<Float32, Unit, Int32>(), [])
            @Expect("assertion#1666: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1667: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply("hello", [])
            @Expect("assertion#1668: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply(StandardClassType<Float32, Unit, Int32>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1669: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1670: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1671: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply(StandardClassType<Float32, Unit, Int32>(), [()])
            @Expect("assertion#1672: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1673: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Unit, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_56")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1674: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_56(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Float32, Int8, UInt32>>().getInstanceFunctions("classInstanceMemberFunction_57").size)
        TypeInfo
            .of<StandardClassType<Float32, Int8, UInt32>>()
            .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
            .apply(StandardClassType<Float32, Int8, UInt32>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [NonGenericClass()])
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [NonGenericClass()])
            @Expect("assertion#1675: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#1676: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#1677: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#1678: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1679: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#1680: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(), [TypeInfo.of<Float64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#1681: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#1682: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1683: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1684: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1685: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#1686: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#1687: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#1688: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#1689: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(), [TypeInfo.of<Float64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#1690: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(), [TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#1691: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int32>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1692: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1693: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(), [NonGenericClass()])
            @Expect("assertion#1694: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#1695: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#1696: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(), [])
            @Expect("assertion#1697: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1698: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply("hello", [])
            @Expect("assertion#1699: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(), [])
            @Expect("assertion#1700: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1701: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply("hello", [])
            @Expect("assertion#1702: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1703: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1704: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1705: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(StandardClassType<Float32, Int8, UInt32>(), [()])
            @Expect("assertion#1706: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1707: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float32, Int8, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_57")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1708: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_57(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, UInt32, Float64>>().getInstanceFunctions("classInstanceMemberFunction_58").size)
        TypeInfo
            .of<StandardClassType<UInt64, UInt32, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
            .apply(StandardClassType<UInt64, UInt32, Float64>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [NonGenericClass()])
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [NonGenericClass()])
            @Expect("assertion#1709: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [NonGenericClass()])
            @Expect("assertion#1710: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#1711: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#1712: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply("hello",
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1713: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#1714: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1715: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#1716: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1717: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1718: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1719: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#1720: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#1721: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1722: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#1723: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1724: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#1725: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1726: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1727: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [NonGenericClass()])
            @Expect("assertion#1728: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#1729: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#1730: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [])
            @Expect("assertion#1731: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1732: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply("hello", [])
            @Expect("assertion#1733: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [])
            @Expect("assertion#1734: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1735: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply("hello", [])
            @Expect("assertion#1736: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1737: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1738: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1739: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(StandardClassType<UInt64, UInt32, Float64>(), [()])
            @Expect("assertion#1740: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1741: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, UInt32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_58")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1742: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_58(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, Int32, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_59").size)
        TypeInfo
            .of<StandardClassType<UInt16, Int32, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
            .apply(StandardClassType<UInt16, Int32, UInt16>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [NonGenericClass()])
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [NonGenericClass()])
            @Expect("assertion#1743: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [NonGenericClass()])
            @Expect("assertion#1744: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1745: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply(StandardClassType<UInt16, Int32, UInt16>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1746: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1747: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1748: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply(StandardClassType<UInt16, Int32, UInt16>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#1749: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply(1i64,
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1750: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1751: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1752: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply(StandardClassType<UInt16, Int32, UInt16>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1753: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply(StandardClassType<UInt16, Int32, UInt16>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1754: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1755: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#1756: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply(StandardClassType<UInt16, Int32, UInt16>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#1757: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply(StandardClassType<UInt16, Int32, UInt16>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#1758: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply(StandardClassType<UInt16, Int32, UInt16>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#1759: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply(StandardClassType<UInt16, Int32, UInt16>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1760: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply(StandardClassType<UInt16, Int32, UInt16>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#1761: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply(StandardClassType<UInt16, Int32, UInt16>(), [NonGenericClass()])
            @Expect("assertion#1762: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#1763: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#1764: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply(StandardClassType<UInt16, Int32, UInt16>(), [])
            @Expect("assertion#1765: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1766: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply("hello", [])
            @Expect("assertion#1767: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply(StandardClassType<UInt16, Int32, UInt16>(), [])
            @Expect("assertion#1768: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1769: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply("hello", [])
            @Expect("assertion#1770: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply(StandardClassType<UInt16, Int32, UInt16>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1771: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1772: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1773: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply(StandardClassType<UInt16, Int32, UInt16>(), [()])
            @Expect("assertion#1774: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1775: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Int32, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_59")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1776: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_59(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int8, UInt8, Bool>>().getInstanceFunctions("classInstanceMemberFunction_60").size)
        TypeInfo
            .of<StandardClassType<Int8, UInt8, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
            .apply(StandardClassType<Int8, UInt8, Bool>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [NonGenericClass()])
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [NonGenericClass()])
            @Expect("assertion#1777: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [NonGenericClass()])
            @Expect("assertion#1778: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#1779: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply(StandardClassType<Int8, UInt8, Bool>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#1780: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#1781: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#1782: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply(StandardClassType<Int8, UInt8, Bool>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#1783: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#1784: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1785: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1786: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply(StandardClassType<Int8, UInt8, Bool>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1787: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply(StandardClassType<Int8, UInt8, Bool>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#1788: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#1789: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#1790: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply(StandardClassType<Int8, UInt8, Bool>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#1791: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply(StandardClassType<Int8, UInt8, Bool>(), [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#1792: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply(StandardClassType<Int8, UInt8, Bool>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#1793: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply(StandardClassType<Int8, UInt8, Bool>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1794: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply(StandardClassType<Int8, UInt8, Bool>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#1795: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply(StandardClassType<Int8, UInt8, Bool>(), [NonGenericClass()])
            @Expect("assertion#1796: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply(1i64, [NonGenericClass()])
            @Expect("assertion#1797: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply("hello", [NonGenericClass()])
            @Expect("assertion#1798: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply(StandardClassType<Int8, UInt8, Bool>(), [])
            @Expect("assertion#1799: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1800: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply("hello", [])
            @Expect("assertion#1801: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply(StandardClassType<Int8, UInt8, Bool>(), [])
            @Expect("assertion#1802: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply(1i64, [])
            @Expect("assertion#1803: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply("hello", [])
            @Expect("assertion#1804: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply(StandardClassType<Int8, UInt8, Bool>(), [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1805: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply(1i64, [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1806: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply("hello", [NonGenericClass(), 114.514000f64])
            @Expect("assertion#1807: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply(StandardClassType<Int8, UInt8, Bool>(), [()])
            @Expect("assertion#1808: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#1809: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int8, UInt8, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_60")[0i64]
                .apply("hello", [()])
            @Expect("assertion#1810: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }
}
