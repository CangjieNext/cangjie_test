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
class testGetStaticFunctions_StandardClassType_14 {
    @TestCase
    func TestCase_283(): Unit {
        // logger.info("testcase TestCase_283 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>().getStaticFunctions("classStaticMemberFunction_66").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt32, Bool, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_66")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()],
                [GenericClassWith1TypeParameters<Bool>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#8389: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Bool, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8390: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Bool, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8391: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int8>()],
                    [])
            @Expect("assertion#8392: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8393: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Bool, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#8394: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Bool, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#8395: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#8396: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#8397: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, Bool, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#8398: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#8399: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int8>()],
                    [])
            @Expect("assertion#8400: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8401: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8402: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8403: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#8404: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#8405: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int8>()],
                    [()])
            @Expect("assertion#8406: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8407: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(), [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#8408: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#8409: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(), [])
            @Expect("assertion#8410: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8411: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(), [])
            @Expect("assertion#8412: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8413: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(),
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#8414: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#8415: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, Bool, Unit>>(), [()])
            @Expect("assertion#8416: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, Bool, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_66")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8417: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_283 ends.")
    }

    @TestCase
    func TestCase_284(): Unit {
        // logger.info("testcase TestCase_284 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>().getStaticFunctions("classStaticMemberFunction_67").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt16, UInt64, Float32>>()
            .getStaticFunctions("classStaticMemberFunction_67")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()],
                [GenericClassWith1TypeParameters<Unit>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#8418: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, UInt64, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8419: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, UInt64, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8420: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#8421: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8422: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, UInt64, Float32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int16>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#8423: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, UInt64, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#8424: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#8425: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#8426: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt16, UInt64, Float32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#8427: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#8428: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#8429: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8430: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8431: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8432: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#8433: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#8434: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#8435: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8436: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#8437: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#8438: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(), [])
            @Expect("assertion#8439: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8440: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(), [])
            @Expect("assertion#8441: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8442: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(),
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#8443: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#8444: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt16, UInt64, Float32>>(), [()])
            @Expect("assertion#8445: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt16, UInt64, Float32>>()
                .getStaticFunctions("classStaticMemberFunction_67")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8446: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_284 ends.")
    }

    @TestCase
    func TestCase_285(): Unit {
        // logger.info("testcase TestCase_285 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>().getStaticFunctions("classStaticMemberFunction_68").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, Bool, Int16>>()
            .getStaticFunctions("classStaticMemberFunction_68")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()],
                [GenericClassWith1TypeParameters<UInt64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#8447: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Bool, Int16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8448: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Bool, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8449: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8450: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8451: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Bool, Int16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#8452: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Bool, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#8453: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#8454: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#8455: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Bool, Int16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#8456: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#8457: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8458: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8459: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8460: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#8461: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#8462: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#8463: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#8464: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8465: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#8466: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#8467: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(), [])
            @Expect("assertion#8468: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8469: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(), [])
            @Expect("assertion#8470: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8471: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(),
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#8472: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#8473: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Bool, Int16>>(), [()])
            @Expect("assertion#8474: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Bool, Int16>>()
                .getStaticFunctions("classStaticMemberFunction_68")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8475: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_285 ends.")
    }

    @TestCase
    func TestCase_286(): Unit {
        // logger.info("testcase TestCase_286 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>().getStaticFunctions("classStaticMemberFunction_69").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int16, Int64, UInt8>>()
            .getStaticFunctions("classStaticMemberFunction_69")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(),
                [TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>()],
                [GenericClassWith1TypeParameters<Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#8476: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int64, UInt8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#8477: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int64, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(), [TypeInfo.of<Int8>(), TypeInfo.of<Bool>()],
                    [])
            @Expect("assertion#8478: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int8>()],
                    [])
            @Expect("assertion#8479: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8480: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int64, UInt8> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#8481: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int64, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#8482: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#8483: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int8>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#8484: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int64, UInt8> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#8485: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#8486: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int8>()],
                    [])
            @Expect("assertion#8487: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8488: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#8489: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(), [TypeInfo.of<Int8>(), TypeInfo.of<Bool>()],
                    [])
            @Expect("assertion#8490: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#8491: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(), [TypeInfo.of<Int8>(), TypeInfo.of<Bool>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#8492: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(), [TypeInfo.of<Int8>(), TypeInfo.of<Int8>()],
                    [()])
            @Expect("assertion#8493: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(),
                    [TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8494: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(), [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#8495: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#8496: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(), [])
            @Expect("assertion#8497: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8498: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(), [])
            @Expect("assertion#8499: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8500: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(),
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#8501: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#8502: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int64, UInt8>>(), [()])
            @Expect("assertion#8503: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int64, UInt8>>()
                .getStaticFunctions("classStaticMemberFunction_69")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8504: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_286 ends.")
    }

    @TestCase
    func TestCase_287(): Unit {
        // logger.info("testcase TestCase_287 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<Int16, Int8, Float64>>().getStaticFunctions("classStaticMemberFunction_70").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<Int16, Int8, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_70")[0i64]
            .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                [GenericClassWith1TypeParameters<Float64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#8505: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int8, Float64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8506: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int8, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8507: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8508: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8509: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int8, Float64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#8510: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int8, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#8511: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#8512: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#8513: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<Int16, Int8, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#8514: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#8515: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#8516: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#8517: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8518: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#8519: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#8520: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#8521: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#8522: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#8523: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#8524: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#8525: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(), [])
            @Expect("assertion#8526: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8527: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(), [])
            @Expect("assertion#8528: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#8529: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(),
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#8530: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#8531: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<StandardClassType<Int16, Int8, Float64>>(), [()])
            @Expect("assertion#8532: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<Int16, Int8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_70")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#8533: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_287 ends.")
    }
}
