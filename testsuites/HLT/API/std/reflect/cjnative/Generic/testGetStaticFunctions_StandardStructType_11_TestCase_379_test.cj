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
class testGetStaticFunctions_StandardStructType_11 {
    @TestCase
    func TestCase_379(): Unit {
        // logger.info("testcase TestCase_379 begins.")
        @Expect(1i64, TypeInfo.of<StandardStructType<Float64, Int64, Unit>>().getStaticFunctions("classStaticMemberFunction_162").size)
        // logger.info("成功调用")
        TypeInfo
            .of<StandardStructType<Float64, Int64, Unit>>()
            .getStaticFunctions("classStaticMemberFunction_162")[0i64]
            .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [114.514000f32])
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [114.514000f32])
            @Expect("assertion#10723: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int64, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#10724: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int64, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#10725: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#10726: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<Int64>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10727: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int64, Unit> got.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()],
                    [114.514000f32, 114.514000f64])
            @Expect("assertion#10728: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int64, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f32, 114.514000f64])
            @Expect("assertion#10729: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#10730: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型错误")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<Int64>(), [TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#10731: not throw", "类型错误")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Wrong typeInfo, excepted Int64 but dependency.StandardStructType<Float64, Int64, Unit> got.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [114.514000f32])
            @Expect("assertion#10732: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f32])
            @Expect("assertion#10733: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#10734: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#10735: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#10736: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#10737: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [114.514000f32, 114.514000f64])
            @Expect("assertion#10738: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Bool>(), TypeInfo.of<Int64>()], [114.514000f32, 114.514000f64])
            @Expect("assertion#10739: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#10740: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(),
                    [TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#10741: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(), [114.514000f32])
            @Expect("assertion#10742: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f32])
            @Expect("assertion#10743: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(), [])
            @Expect("assertion#10744: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10745: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(), [])
            @Expect("assertion#10746: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<Int64>(), [])
            @Expect("assertion#10747: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(), [114.514000f32, 114.514000f64])
            @Expect("assertion#10748: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<Int64>(), [114.514000f32, 114.514000f64])
            @Expect("assertion#10749: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<StandardStructType<Float64, Int64, Unit>>(), [()])
            @Expect("assertion#10750: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("函数为泛型，类型形参列表未指定")
        try {
            TypeInfo
                .of<StandardStructType<Float64, Int64, Unit>>()
                .getStaticFunctions("classStaticMemberFunction_162")[0i64]
                .apply(TypeInfo.of<Int64>(), [()])
            @Expect("assertion#10751: not throw", "函数为泛型，类型形参列表未指定")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The generic function cannot be applied without `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_379 ends.")
    }
}
