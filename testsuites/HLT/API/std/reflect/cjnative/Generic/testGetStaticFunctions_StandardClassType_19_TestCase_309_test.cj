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
    func TestCase_309(): Unit {
        // logger.info("testcase TestCase_309 begins.")
        @Expect(1i64, TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>().getStaticFunctions("classStaticMemberFunction_92").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardClassType<UInt64, Unit, Int32>>()
            .getStaticFunctions("classStaticMemberFunction_92")[0i64]
            .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()],
                [GenericStructWith1TypeParameters<Int64>()])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#9143: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Unit, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#9144: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Unit, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#9145: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#9146: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9147: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Unit, Int32> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9148: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Unit, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9149: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#9150: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#9151: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardClassType<UInt64, Unit, Int32> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#9152: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#9153: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#9154: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#9155: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#9156: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#9157: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9158: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt64>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9159: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#9160: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#9161: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#9162: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#9163: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(), [])
            @Expect("assertion#9164: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9165: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(), [])
            @Expect("assertion#9166: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#9167: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(),
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9168: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<Int64>(), [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#9169: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<StandardClassType<UInt64, Unit, Int32>>(), [()])
            @Expect("assertion#9170: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardClassType<UInt64, Unit, Int32>>()
                .getStaticFunctions("classStaticMemberFunction_92")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#9171: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_309 ends.")
    }
}
