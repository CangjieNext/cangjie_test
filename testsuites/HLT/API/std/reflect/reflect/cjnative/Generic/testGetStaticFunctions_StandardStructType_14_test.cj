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
class testGetStaticFunctions_StandardStructType_14 {
    @TestCase
    func TestCase_392(): Unit {
        // logger.info("testcase TestCase_392 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>().getStaticFunctions("classStaticMemberFunction_175").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int32, Int16, UInt32>>()
            .getStaticFunctions("classStaticMemberFunction_175")[0i64]
            .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                [GenericClassWith1TypeParameters<Bool>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#11100: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Int16, UInt32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11101: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Int16, UInt32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11102: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11103: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11104: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Int16, UInt32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#11105: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Int16, UInt32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#11106: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11107: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11108: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Int32, Int16, UInt32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#11109: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#11110: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#11111: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11112: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11113: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11114: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#11115: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#11116: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#11117: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11118: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#11119: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#11120: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(), [])
            @Expect("assertion#11121: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11122: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(), [])
            @Expect("assertion#11123: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11124: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(),
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#11125: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#11126: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<StandardStructType<Int32, Int16, UInt32>>(), [()])
            @Expect("assertion#11127: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int32, Int16, UInt32>>()
                .getStaticFunctions("classStaticMemberFunction_175")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11128: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_392 ends.")
    }

    @TestCase
    func TestCase_393(): Unit {
        // logger.info("testcase TestCase_393 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>().getStaticFunctions("classStaticMemberFunction_176").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float32, UInt32, UInt16>>()
            .getStaticFunctions("classStaticMemberFunction_176")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()],
                [GenericClassWith1TypeParameters<Unit>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#11129: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, UInt32, UInt16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11130: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, UInt32, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11131: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11132: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11133: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, UInt32, UInt16> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#11134: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, UInt32, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#11135: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#11136: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#11137: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float32, UInt32, UInt16> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#11138: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#11139: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#11140: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11141: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11142: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#11143: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#11144: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#11145: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#11146: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11147: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#11148: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#11149: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(), [])
            @Expect("assertion#11150: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11151: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(), [])
            @Expect("assertion#11152: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11153: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(),
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#11154: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#11155: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float32, UInt32, UInt16>>(), [()])
            @Expect("assertion#11156: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float32, UInt32, UInt16>>()
                .getStaticFunctions("classStaticMemberFunction_176")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11157: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_393 ends.")
    }

    @TestCase
    func TestCase_394(): Unit {
        // logger.info("testcase TestCase_394 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Int16, Int32>>().getStaticFunctions("classStaticMemberFunction_177").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, Int16, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_177")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()],
                [GenericClassWith1TypeParameters<Float64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#11158: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int16, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#11159: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int16, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#11160: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#11161: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11162: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int16, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#11163: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int16, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#11164: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#11165: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#11166: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int16, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#11167: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#11168: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#11169: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11170: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#11171: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#11172: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#11173: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#11174: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#11175: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11176: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#11177: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Float64>()])
            @Expect("assertion#11178: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(), [])
            @Expect("assertion#11179: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11180: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(), [])
            @Expect("assertion#11181: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11182: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(),
                    [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#11183: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#11184: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int16, Int32>>(), [()])
            @Expect("assertion#11185: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int16, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_177")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11186: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_394 ends.")
    }

    @TestCase
    func TestCase_395(): Unit {
        // logger.info("testcase TestCase_395 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, Int64, Unit>>().getStaticFunctions("classStaticMemberFunction_178").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, Int64, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_178")[0i64]
            .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()],
                [GenericClassWith1TypeParameters<Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#11187: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int64, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11188: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int64, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11189: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                    [])
            @Expect("assertion#11190: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11191: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int64, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11192: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int64, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11193: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#11194: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#11195: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Bool, Int64, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#11196: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#11197: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                    [])
            @Expect("assertion#11198: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#11199: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11200: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#11201: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11202: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11203: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(), [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                    [()])
            @Expect("assertion#11204: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#11205: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(), [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#11206: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#11207: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(), [])
            @Expect("assertion#11208: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11209: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(), [])
            @Expect("assertion#11210: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#11211: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(),
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11212: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#11213: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<StandardStructType<Bool, Int64, Unit>>(), [()])
            @Expect("assertion#11214: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_178")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#11215: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_395 ends.")
    }

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
