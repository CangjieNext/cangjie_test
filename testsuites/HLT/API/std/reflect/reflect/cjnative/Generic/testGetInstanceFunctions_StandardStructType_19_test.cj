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
class testGetInstanceFunctions_StandardStructType_19 {
    @TestCase
    func TestCase_199(): Unit {
        // logger.info("testcase TestCase_199 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Bool, Int16, Int32>>().getInstanceFunctions("classInstanceMemberFunction_200").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Bool, Int16, Int32>>()
            .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
            .apply(StandardStructType<Bool, Int16, Int32>(),
                [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [NonGenericStruct()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#6308: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [NonGenericStruct()])
            @Expect("assertion#6309: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#6310: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(), [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#6311: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply("hello",
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6312: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#6313: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#6314: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6315: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6316: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6317: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6318: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#6319: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#6320: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#6321: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#6322: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#6323: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(), [TypeInfo.of<Int64>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#6324: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6325: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(),
                    [TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6326: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(), [NonGenericStruct()])
            @Expect("assertion#6327: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(1i64, [NonGenericStruct()])
            @Expect("assertion#6328: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply("hello", [NonGenericStruct()])
            @Expect("assertion#6329: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(), [])
            @Expect("assertion#6330: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6331: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply("hello", [])
            @Expect("assertion#6332: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(), [])
            @Expect("assertion#6333: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6334: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply("hello", [])
            @Expect("assertion#6335: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(), [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6336: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(1i64, [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6337: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply("hello", [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#6338: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(StandardStructType<Bool, Int16, Int32>(), [()])
            @Expect("assertion#6339: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6340: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Bool, Int16, Int32>>()
                .getInstanceFunctions("classInstanceMemberFunction_200")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6341: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_199 ends.")
    }

    @TestCase
    func TestCase_200(): Unit {
        // logger.info("testcase TestCase_200 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt32, Float32, Int8>>().getInstanceFunctions("classInstanceMemberFunction_201").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt32, Float32, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
            .apply(StandardStructType<UInt32, Float32, Int8>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Bool>()],
                [GenericStructWith1TypeParameters<Int64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Bool>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#6342: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#6343: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#6344: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(), [TypeInfo.of<Bool>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#6345: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Bool>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6346: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#6347: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(), [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#6348: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6349: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply("hello", [TypeInfo.of<Bool>(), TypeInfo.of<Bool>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#6350: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#6351: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#6352: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#6353: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(1i64, [TypeInfo.of<Bool>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#6354: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply("hello", [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#6355: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#6356: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(), [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#6357: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(), [TypeInfo.of<Bool>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#6358: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Bool>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#6359: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6360: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(), [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#6361: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#6362: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#6363: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(), [])
            @Expect("assertion#6364: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6365: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply("hello", [])
            @Expect("assertion#6366: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(), [])
            @Expect("assertion#6367: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6368: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply("hello", [])
            @Expect("assertion#6369: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(),
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#6370: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#6371: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#6372: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(StandardStructType<UInt32, Float32, Int8>(), [()])
            @Expect("assertion#6373: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6374: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt32, Float32, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_201")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6375: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_200 ends.")
    }

    @TestCase
    func TestCase_201(): Unit {
        // logger.info("testcase TestCase_201 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, Int32, UInt32>>().getInstanceFunctions("classInstanceMemberFunction_202").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Int64, Int32, UInt32>>()
            .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
            .apply(StandardStructType<Int64, Int32, UInt32>(),
                [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                [GenericStructWith1TypeParameters<Bool>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#6376: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#6377: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6378: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(), [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6379: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6380: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6381: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#6382: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6383: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6384: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6385: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6386: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6387: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6388: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#6389: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#6390: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#6391: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(), [TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6392: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6393: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(),
                    [TypeInfo.of<Unit>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6394: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(), [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#6395: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#6396: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#6397: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(), [])
            @Expect("assertion#6398: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6399: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply("hello", [])
            @Expect("assertion#6400: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(), [])
            @Expect("assertion#6401: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6402: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply("hello", [])
            @Expect("assertion#6403: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(),
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6404: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6405: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6406: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(StandardStructType<Int64, Int32, UInt32>(), [()])
            @Expect("assertion#6407: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6408: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_202")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6409: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_201 ends.")
    }

    @TestCase
    func TestCase_202(): Unit {
        // logger.info("testcase TestCase_202 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt8, Bool, UInt32>>().getInstanceFunctions("classInstanceMemberFunction_203").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<UInt8, Bool, UInt32>>()
            .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
            .apply(StandardStructType<UInt8, Bool, UInt32>(),
                [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()],
                [GenericStructWith1TypeParameters<Unit>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#6410: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#6411: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6412: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6413: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply("hello",
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6414: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6415: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#6416: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6417: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply("hello", [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#6418: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(1i64, [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#6419: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#6420: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#6421: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(1i64, [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#6422: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply("hello", [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#6423: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#6424: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(), [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#6425: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(), [TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#6426: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#6427: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(),
                    [TypeInfo.of<Float64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6428: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(), [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#6429: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#6430: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#6431: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(), [])
            @Expect("assertion#6432: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6433: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply("hello", [])
            @Expect("assertion#6434: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(), [])
            @Expect("assertion#6435: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6436: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply("hello", [])
            @Expect("assertion#6437: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(),
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#6438: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#6439: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#6440: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(StandardStructType<UInt8, Bool, UInt32>(), [()])
            @Expect("assertion#6441: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6442: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<UInt8, Bool, UInt32>>()
                .getInstanceFunctions("classInstanceMemberFunction_203")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6443: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_202 ends.")
    }

    @TestCase
    func TestCase_203(): Unit {
        // logger.info("testcase TestCase_203 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, Bool, Unit>>().getInstanceFunctions("classInstanceMemberFunction_204").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Unit, Bool, Unit>>()
            .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
            .apply(StandardStructType<Unit, Bool, Unit>(),
                [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()],
                [GenericStructWith1TypeParameters<Unit>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#6444: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#6445: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#6446: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply(StandardStructType<Unit, Bool, Unit>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#6447: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply("hello",
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#6448: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#6449: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply(StandardStructType<Unit, Bool, Unit>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6450: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(),
                    TypeInfo.of<Float64>()], [])
            @Expect("assertion#6451: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply("hello", [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#6452: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply(1i64, [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#6453: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply(StandardStructType<Unit, Bool, Unit>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#6454: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply(StandardStructType<Unit, Bool, Unit>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#6455: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply(1i64, [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#6456: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply("hello", [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#6457: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply(StandardStructType<Unit, Bool, Unit>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#6458: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply(StandardStructType<Unit, Bool, Unit>(), [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#6459: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply(StandardStructType<Unit, Bool, Unit>(), [TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#6460: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply(StandardStructType<Unit, Bool, Unit>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#6461: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply(StandardStructType<Unit, Bool, Unit>(),
                    [TypeInfo.of<Int32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6462: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply(StandardStructType<Unit, Bool, Unit>(), [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#6463: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#6464: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#6465: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply(StandardStructType<Unit, Bool, Unit>(), [])
            @Expect("assertion#6466: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6467: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply("hello", [])
            @Expect("assertion#6468: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply(StandardStructType<Unit, Bool, Unit>(), [])
            @Expect("assertion#6469: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6470: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply("hello", [])
            @Expect("assertion#6471: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply(StandardStructType<Unit, Bool, Unit>(), [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#6472: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#6473: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#6474: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply(StandardStructType<Unit, Bool, Unit>(), [()])
            @Expect("assertion#6475: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6476: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, Unit>>()
                .getInstanceFunctions("classInstanceMemberFunction_204")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6477: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_203 ends.")
    }
}
