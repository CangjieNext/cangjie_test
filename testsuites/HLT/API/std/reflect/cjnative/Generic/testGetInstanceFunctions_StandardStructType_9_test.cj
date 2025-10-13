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
class testGetInstanceFunctions_StandardStructType_9 {
    @TestCase
    func TestCase_149(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt64, Int8, Int8>>().getInstanceFunctions("classInstanceMemberFunction_150").size)
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(StandardStructType<UInt64, Int8, Int8>(), [], [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#4638: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#4639: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4640: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(StandardStructType<UInt64, Int8, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4641: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4642: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4643: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(StandardStructType<UInt64, Int8, Int8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4644: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(StandardStructType<UInt64, Int8, Int8>(), [],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4645: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(StandardStructType<UInt64, Int8, Int8>(), [], [()])
            @Expect("assertion#4646: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4647: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply("hello", [], [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#4648: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4649: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4650: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(1i64, [], [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4651: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4652: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<UInt64, Int8, Int8>>()
            .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
            .apply(StandardStructType<UInt64, Int8, Int8>(), [GenericStructWith2TypeParameters<Int64, Int64>()])
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#4653: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt64, Int8, Int8>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#4654: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt64, Int8, Int8>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(StandardStructType<UInt64, Int8, Int8>(), [])
            @Expect("assertion#4655: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4656: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply("hello", [])
            @Expect("assertion#4657: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(StandardStructType<UInt64, Int8, Int8>(), [])
            @Expect("assertion#4658: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4659: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply("hello", [])
            @Expect("assertion#4660: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(StandardStructType<UInt64, Int8, Int8>(),
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4661: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4662: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#4663: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(StandardStructType<UInt64, Int8, Int8>(), [()])
            @Expect("assertion#4664: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4665: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt64, Int8, Int8>>()
                .getInstanceFunctions("classInstanceMemberFunction_150")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4666: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_150(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Unit, UInt64, Bool>>().getInstanceFunctions("classInstanceMemberFunction_151").size)
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(StandardStructType<Unit, UInt64, Bool>(), [], [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4667: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4668: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4669: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(StandardStructType<Unit, UInt64, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4670: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4671: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4672: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(StandardStructType<Unit, UInt64, Bool>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4673: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(StandardStructType<Unit, UInt64, Bool>(), [],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4674: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(StandardStructType<Unit, UInt64, Bool>(), [], [()])
            @Expect("assertion#4675: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4676: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply("hello", [], [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4677: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4678: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4679: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(1i64, [], [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4680: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4681: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<Unit, UInt64, Bool>>()
            .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
            .apply(StandardStructType<Unit, UInt64, Bool>(), [GenericStructWith2TypeParameters<Bool, Bool>()])
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4682: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Unit, UInt64, Bool>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4683: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Unit, UInt64, Bool>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(StandardStructType<Unit, UInt64, Bool>(), [])
            @Expect("assertion#4684: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4685: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply("hello", [])
            @Expect("assertion#4686: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(StandardStructType<Unit, UInt64, Bool>(), [])
            @Expect("assertion#4687: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4688: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply("hello", [])
            @Expect("assertion#4689: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(StandardStructType<Unit, UInt64, Bool>(),
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4690: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4691: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4692: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(StandardStructType<Unit, UInt64, Bool>(), [()])
            @Expect("assertion#4693: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4694: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Unit, UInt64, Bool>>()
                .getInstanceFunctions("classInstanceMemberFunction_151")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4695: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_151(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int64, Int32, Float64>>().getInstanceFunctions("classInstanceMemberFunction_152").size)
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(StandardStructType<Int64, Int32, Float64>(), [], [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#4696: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#4697: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4698: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(StandardStructType<Int64, Int32, Float64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4699: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4700: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#4701: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(StandardStructType<Int64, Int32, Float64>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4702: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(StandardStructType<Int64, Int32, Float64>(), [],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#4703: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(StandardStructType<Int64, Int32, Float64>(), [], [()])
            @Expect("assertion#4704: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4705: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply("hello", [], [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#4706: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4707: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4708: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(1i64, [], [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#4709: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4710: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<Int64, Int32, Float64>>()
            .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
            .apply(StandardStructType<Int64, Int32, Float64>(), [GenericStructWith2TypeParameters<Unit, Unit>()])
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#4711: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int64, Int32, Float64>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#4712: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int64, Int32, Float64>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(StandardStructType<Int64, Int32, Float64>(), [])
            @Expect("assertion#4713: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4714: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply("hello", [])
            @Expect("assertion#4715: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(StandardStructType<Int64, Int32, Float64>(), [])
            @Expect("assertion#4716: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4717: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply("hello", [])
            @Expect("assertion#4718: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(StandardStructType<Int64, Int32, Float64>(),
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#4719: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#4720: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#4721: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(StandardStructType<Int64, Int32, Float64>(), [()])
            @Expect("assertion#4722: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4723: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int64, Int32, Float64>>()
                .getInstanceFunctions("classInstanceMemberFunction_152")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4724: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_152(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<UInt16, Float64, Int16>>().getInstanceFunctions("classInstanceMemberFunction_153").size)
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(StandardStructType<UInt16, Float64, Int16>(), [],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#4725: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#4726: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4727: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(StandardStructType<UInt16, Float64, Int16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4728: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4729: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#4730: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(StandardStructType<UInt16, Float64, Int16>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4731: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(StandardStructType<UInt16, Float64, Int16>(), [],
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#4732: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(StandardStructType<UInt16, Float64, Int16>(), [], [()])
            @Expect("assertion#4733: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4734: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply("hello", [], [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#4735: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4736: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4737: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(1i64, [], [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#4738: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4739: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<UInt16, Float64, Int16>>()
            .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
            .apply(StandardStructType<UInt16, Float64, Int16>(), [GenericStructWith2TypeParameters<UInt16, UInt16>()])
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#4740: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt16, Float64, Int16>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#4741: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<UInt16, Float64, Int16>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(StandardStructType<UInt16, Float64, Int16>(), [])
            @Expect("assertion#4742: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4743: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply("hello", [])
            @Expect("assertion#4744: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(StandardStructType<UInt16, Float64, Int16>(), [])
            @Expect("assertion#4745: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4746: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply("hello", [])
            @Expect("assertion#4747: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(StandardStructType<UInt16, Float64, Int16>(),
                    [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#4748: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#4749: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#4750: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(StandardStructType<UInt16, Float64, Int16>(), [()])
            @Expect("assertion#4751: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4752: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<UInt16, Float64, Int16>>()
                .getInstanceFunctions("classInstanceMemberFunction_153")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4753: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }

    @TestCase
    func TestCase_153(): Unit {
        @Expect(1i64, TypeInfo.of<StandardStructType<Int32, Bool, UInt8>>().getInstanceFunctions("classInstanceMemberFunction_154").size)
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt8>(), [], [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4754: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4755: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4756: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4757: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4758: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply("hello", [TypeInfo.of<Float32>()], [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4759: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt8>(), [TypeInfo.of<Float32>()], [])
            @Expect("assertion#4760: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt8>(), [],
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4761: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt8>(), [], [()])
            @Expect("assertion#4762: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(1i64, [TypeInfo.of<Float32>()], [()])
            @Expect("assertion#4763: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply("hello", [], [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4764: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply("hello", [], [])
            @Expect("assertion#4765: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(1i64, [], [])
            @Expect("assertion#4766: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(1i64, [], [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4767: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply("hello", [], [()])
            @Expect("assertion#4768: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        TypeInfo
            .of<StandardStructType<Int32, Bool, UInt8>>()
            .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
            .apply(StandardStructType<Int32, Bool, UInt8>(), [GenericStructWith2TypeParameters<Bool, Bool>()])
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4769: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int32, Bool, UInt8>\", but now it`s \"Int64\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Bool, Bool>()])
            @Expect("assertion#4770: not throw", "实例类型错误")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input instance should be \"dependency.StandardStructType<Int32, Bool, UInt8>\", but now it`s \"String\"")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt8>(), [])
            @Expect("assertion#4771: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4772: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply("hello", [])
            @Expect("assertion#4773: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt8>(), [])
            @Expect("assertion#4774: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(1i64, [])
            @Expect("assertion#4775: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply("hello", [])
            @Expect("assertion#4776: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt8>(),
                    [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4777: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(1i64, [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4778: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply("hello", [GenericStructWith2TypeParameters<Bool, Bool>(), 114.514000f64])
            @Expect("assertion#4779: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(StandardStructType<Int32, Bool, UInt8>(), [()])
            @Expect("assertion#4780: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply(1i64, [()])
            @Expect("assertion#4781: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            TypeInfo
                .of<StandardStructType<Int32, Bool, UInt8>>()
                .getInstanceFunctions("classInstanceMemberFunction_154")[0i64]
                .apply("hello", [()])
            @Expect("assertion#4782: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
    }
}
