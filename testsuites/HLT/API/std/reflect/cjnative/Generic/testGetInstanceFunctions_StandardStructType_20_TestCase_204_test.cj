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
class testGetInstanceFunctions_StandardStructType_20 {
    @TestCase
    func TestCase_204(): Unit {
        // logger.info("testcase TestCase_204 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, Bool, UInt16>>().getInstanceFunctions("classInstanceMemberFunction_205").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Unit, Bool, UInt16>>()
            .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
            .apply(StandardStructType<Unit, Bool, UInt16>(),
                [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()],
                [GenericStructWith1TypeParameters<Bool>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#6478: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#6479: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#6480: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#6481: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6482: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#6483: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#6484: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#6485: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply("hello", [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6486: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(1i64, [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6487: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6488: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#6489: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(1i64, [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#6490: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply("hello", [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#6491: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#6492: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(), [TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#6493: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(), [TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#6494: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6495: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(),
                    [TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#6496: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(), [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#6497: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#6498: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#6499: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(), [])
            @Expect("assertion#6500: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6501: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply("hello", [])
            @Expect("assertion#6502: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(), [])
            @Expect("assertion#6503: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(1i64, [])
            @Expect("assertion#6504: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply("hello", [])
            @Expect("assertion#6505: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(),
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6506: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(1i64, [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6507: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply("hello", [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#6508: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(StandardStructType<Unit, Bool, UInt16>(), [()])
            @Expect("assertion#6509: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#6510: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Unit, Bool, UInt16>>()
                .getInstanceFunctions("classInstanceMemberFunction_205")[0i64]
                .apply("hello", [()])
            @Expect("assertion#6511: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_204 ends.")
    }
}
