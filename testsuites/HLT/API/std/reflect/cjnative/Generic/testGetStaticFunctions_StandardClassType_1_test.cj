/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
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
class testGetStaticFunctions_StandardClassType_1 {
    @TestCase
    func TestCase_218(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, Float64, Unit>>().getStaticFunctions("classStaticMemberFunction_1").size)
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_1")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float64, Unit>>(), [], [])
            @Expect("assertion#6954: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_1")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#6955: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_1")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [114.514000f64])
            @Expect("assertion#6956: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_1")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float64, Unit>>(), [TypeInfo.of<Float32>()],
                    [114.514000f64])
            @Expect("assertion#6957: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<UInt16, Float64, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_1")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt16, Float64, Unit>>(), [])
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_1")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#6958: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Float64, Unit> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_1")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, Float64, Unit>>(), [114.514000f64])
            @Expect("assertion#6959: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt16, Float64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_1")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#6960: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, Float64, Unit> got.")
        }
    }

    @TestCase
    func TestCase_219(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Float32, UInt64>>().getStaticFunctions("classStaticMemberFunction_2").size)
        TypeInfo
            .of<StandardClassType<UInt64, Float32, UInt64>>()
            .getStaticFunctions("classStaticMemberFunction_2")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt64, Float32, UInt64>>(),
                [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#6961: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Float32, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()],
                    [114.514000f64])
            @Expect("assertion#6962: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Float32, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float32, UInt64>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [114.514000f64])
            @Expect("assertion#6963: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float32, UInt64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6964: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float32, UInt64>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6965: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>()], [114.514000f64])
            @Expect("assertion#6966: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Float32, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#6967: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Float32, UInt64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float32, UInt64>>(), [])
            @Expect("assertion#6968: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#6969: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Float32, UInt64>>(), [114.514000f64])
            @Expect("assertion#6970: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Float32, UInt64>>()
                .getStaticFunctions("classStaticMemberFunction_2")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#6971: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_220(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Unit, UInt16, Int8>>().getStaticFunctions("classStaticMemberFunction_3").size)
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt16, Int8>>(), [],
                    [GenericClassWith1TypeParameters<Int64>(), GenericClassWith2TypeParameters<Unit, Unit>(),
                        GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6972: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Int64>(), GenericClassWith2TypeParameters<Unit, Unit>(),
                        GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6973: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(), [],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6974: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt16, Int8>>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Unit, Unit>(), GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6975: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt16, Int8>>(), [],
                    [GenericClassWith1TypeParameters<Int64>(), GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6976: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Int64>(), GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6977: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt16, Int8>>(), [],
                    [GenericClassWith1TypeParameters<Int64>(), GenericClassWith2TypeParameters<Unit, Unit>(),
                        GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#6978: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Int64>(), GenericClassWith2TypeParameters<Unit, Unit>(),
                        GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#6979: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt16, Int8>>(), [],
                    [(), GenericClassWith2TypeParameters<Unit, Unit>(), GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6980: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [(), GenericClassWith2TypeParameters<Unit, Unit>(), GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6981: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt16, Int8>>(), [],
                    [GenericClassWith1TypeParameters<Int64>(), (), GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6982: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Int64>(), (), GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6983: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt16, Int8>>(), [],
                    [GenericClassWith1TypeParameters<Int64>(), GenericClassWith2TypeParameters<Unit, Unit>(), ()])
            @Expect("assertion#6984: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Int64>(), GenericClassWith2TypeParameters<Unit, Unit>(), ()])
            @Expect("assertion#6985: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Unit, UInt16, Int8>>()
            .getStaticFunctions("classStaticMemberFunction_3")[0i64]
            .apply(TypeInfo.of<StandardClassType<Unit, UInt16, Int8>>(),
                [GenericClassWith1TypeParameters<Int64>(), GenericClassWith2TypeParameters<Unit, Unit>(),
                    GenericClassWith2TypeParameters<Unit, Unit>()])
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [GenericClassWith1TypeParameters<Int64>(), GenericClassWith2TypeParameters<Unit, Unit>(),
                        GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6986: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, UInt16, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt16, Int8>>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>(), GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6987: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [GenericClassWith2TypeParameters<Unit, Unit>(), GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6988: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, UInt16, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt16, Int8>>(),
                    [GenericClassWith1TypeParameters<Int64>(), GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6989: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [GenericClassWith1TypeParameters<Int64>(), GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6990: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, UInt16, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt16, Int8>>(),
                    [GenericClassWith1TypeParameters<Int64>(), GenericClassWith2TypeParameters<Unit, Unit>(),
                        GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#6991: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [GenericClassWith1TypeParameters<Int64>(), GenericClassWith2TypeParameters<Unit, Unit>(),
                        GenericClassWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#6992: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, UInt16, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt16, Int8>>(),
                    [(), GenericClassWith2TypeParameters<Unit, Unit>(), GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6993: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [(), GenericClassWith2TypeParameters<Unit, Unit>(), GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6994: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, UInt16, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt16, Int8>>(),
                    [GenericClassWith1TypeParameters<Int64>(), (), GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6995: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [GenericClassWith1TypeParameters<Int64>(), (), GenericClassWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#6996: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, UInt16, Int8> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<StandardClassType<Unit, UInt16, Int8>>(),
                    [GenericClassWith1TypeParameters<Int64>(), GenericClassWith2TypeParameters<Unit, Unit>(), ()])
            @Expect("assertion#6997: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Unit, UInt16, Int8>>()
                .getStaticFunctions("classStaticMemberFunction_3")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [GenericClassWith1TypeParameters<Int64>(), GenericClassWith2TypeParameters<Unit, Unit>(), ()])
            @Expect("assertion#6998: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Unit, UInt16, Int8> got.")
        }
    }

    @TestCase
    func TestCase_221(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>().getStaticFunctions("classStaticMemberFunction_4").size)
        TypeInfo
            .of<StandardClassType<Int64, UInt32, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_4")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(),
                    GenericStructWith1TypeParameters<Float64>()])
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#6999: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt32, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7000: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt32, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7001: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#7002: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#7003: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt32, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#7004: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt32, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#7005: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [(), GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7006: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [(), GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7007: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt32, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, (), GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7008: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, (), GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7009: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt32, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(), ()])
            @Expect("assertion#7010: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(), ()])
            @Expect("assertion#7011: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int64, UInt32, Float64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7012: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7013: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7014: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7015: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#7016: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#7017: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#7018: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#7019: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()],
                    [(), GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7020: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [(), GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7021: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()],
                    [114.514000f64, (), GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7022: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, (), GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7023: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(), ()])
            @Expect("assertion#7024: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(), ()])
            @Expect("assertion#7025: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7026: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7027: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [GenericStructWith2TypeParameters<Float64, Float64>(), GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7028: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [GenericStructWith2TypeParameters<Float64, Float64>(), GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7029: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#7030: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#7031: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#7032: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#7033: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [(), GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7034: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [(), GenericStructWith2TypeParameters<Float64, Float64>(),
                        GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7035: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [114.514000f64, (), GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7036: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64, (), GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#7037: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int64, UInt32, Float64>>(),
                    [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(), ()])
            @Expect("assertion#7038: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Int64, UInt32, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_4")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64, GenericStructWith2TypeParameters<Float64, Float64>(), ()])
            @Expect("assertion#7039: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_222(): Unit {
        @Expect(1i64, TypeInfo.of<StandardClassType<Float64, Int64, Int64>>().getStaticFunctions("classStaticMemberFunction_5").size)
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, Int64>>(), [], [123i64])
            @Expect("assertion#7040: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [123i64])
            @Expect("assertion#7041: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [], [])
            @Expect("assertion#7042: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, Int64>>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7043: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, Int64>>(), [], [])
            @Expect("assertion#7044: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#7045: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, Int64>>(), [], [123i64, 114.514000f64])
            @Expect("assertion#7046: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [123i64, 114.514000f64])
            @Expect("assertion#7047: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, Int64>>(), [], [114.514000f64])
            @Expect("assertion#7048: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#7049: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardClassType<Float64, Int64, Int64>>()
            .getStaticFunctions("classStaticMemberFunction_5")[0i64]
            .apply(TypeInfo.of<StandardClassType<Float64, Int64, Int64>>(), [123i64])
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64])
            @Expect("assertion#7050: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, Int64, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, Int64>>(), [])
            @Expect("assertion#7051: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7052: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, Int64, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, Int64>>(), [])
            @Expect("assertion#7053: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#7054: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, Int64, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, Int64>>(), [123i64, 114.514000f64])
            @Expect("assertion#7055: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [123i64, 114.514000f64])
            @Expect("assertion#7056: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, Int64, Int64> got.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<StandardClassType<Float64, Int64, Int64>>(), [114.514000f64])
            @Expect("assertion#7057: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardClassType<Float64, Int64, Int64>>()
                .getStaticFunctions("classStaticMemberFunction_5")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f64])
            @Expect("assertion#7058: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Float64, Int64, Int64> got.")
        }
    }
}
