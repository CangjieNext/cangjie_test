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
class testGetStaticFunctions_StandardClassType_19 {
    @TestCase
    func TestCase_310(): Unit {
        // logger.info("testcase TestCase_310 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>().getStaticFunctions("classStaticMemberFunction_93").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt32, UInt8, Float64>>()
            .getStaticFunctions("classStaticMemberFunction_93")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                [GenericStructWith1TypeParameters<Bool>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                    [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#9172: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, Float64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#9173: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#9174: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#9175: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9176: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, Float64> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#9177: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#9178: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#9179: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#9180: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt32, UInt8, Float64> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>()], [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#9181: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#9182: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#9183: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9184: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#9185: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#9186: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#9187: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#9188: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#9189: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9190: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#9191: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Bool>()])
            @Expect("assertion#9192: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [])
            @Expect("assertion#9193: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9194: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [])
            @Expect("assertion#9195: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9196: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(),
                    [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#9197: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#9198: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt32, UInt8, Float64>>(), [()])
            @Expect("assertion#9199: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt32, UInt8, Float64>>()
                .getStaticFunctions("classStaticMemberFunction_93")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9200: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_310 ends.")
    }
}
