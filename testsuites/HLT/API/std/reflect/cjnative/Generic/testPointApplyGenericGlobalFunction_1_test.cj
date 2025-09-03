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
class testPointApplyGenericGlobalFunction_1 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_436(): Unit {
        try {
            packageInfo.getFunctions("globalFunction_1")[0i64].apply([], [])
            @Expect("assertion#12376: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_1")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12377: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_1")[0i64].apply([], [114.514000f64])
            @Expect("assertion#12378: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_1")[0i64].apply([TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#12379: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_437(): Unit {
        packageInfo.getFunctions("globalFunction_2")[0i64].apply([TypeInfo.of<Int64>()], [])
        try {
            packageInfo.getFunctions("globalFunction_2")[0i64].apply([], [])
            @Expect("assertion#12380: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_2")[0i64].apply([], [])
            @Expect("assertion#12381: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_2")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12382: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_2")[0i64].apply([TypeInfo.of<Int64>()], [114.514000f64])
            @Expect("assertion#12383: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_2")[0i64].apply([], [114.514000f64])
            @Expect("assertion#12384: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_2")[0i64].apply([], [114.514000f64])
            @Expect("assertion#12385: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_2")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [114.514000f64])
            @Expect("assertion#12386: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_438(): Unit {
        packageInfo
            .getFunctions("globalFunction_3")[0i64]
            .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [])
        try {
            packageInfo.getFunctions("globalFunction_3")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#12387: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_3")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#12388: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_3")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12389: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_3")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [114.514000f64])
            @Expect("assertion#12390: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_3")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt16>()], [114.514000f64])
            @Expect("assertion#12391: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_3")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [114.514000f64])
            @Expect("assertion#12392: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_3")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#12393: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_439(): Unit {
        try {
            packageInfo.getFunctions("globalFunction_4")[0i64].apply([], [1i8])
            @Expect("assertion#12394: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_4")[0i64].apply([TypeInfo.of<Float32>()], [1i8])
            @Expect("assertion#12395: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_4")[0i64].apply([], [])
            @Expect("assertion#12396: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_4")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12397: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_4")[0i64].apply([], [])
            @Expect("assertion#12398: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_4")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12399: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_4")[0i64].apply([], [1i8, 114.514000f64])
            @Expect("assertion#12400: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_4")[0i64].apply([TypeInfo.of<Float32>()], [1i8, 114.514000f64])
            @Expect("assertion#12401: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_4")[0i64].apply([], [114.514000f64])
            @Expect("assertion#12402: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_4")[0i64].apply([TypeInfo.of<Float32>()], [114.514000f64])
            @Expect("assertion#12403: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_440(): Unit {
        packageInfo
            .getFunctions("globalFunction_5")[0i64]
            .apply([TypeInfo.of<Int8>()], [GenericClassWith2TypeParameters<Int16, Int16>()])
        try {
            packageInfo
                .getFunctions("globalFunction_5")[0i64]
                .apply([], [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#12404: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_5")[0i64]
                .apply([], [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#12405: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_5")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#12406: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_5")[0i64].apply([TypeInfo.of<Int8>()], [])
            @Expect("assertion#12407: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_5")[0i64].apply([], [])
            @Expect("assertion#12408: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_5")[0i64].apply([], [])
            @Expect("assertion#12409: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_5")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12410: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_5")[0i64].apply([TypeInfo.of<Int8>()], [])
            @Expect("assertion#12411: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_5")[0i64].apply([], [])
            @Expect("assertion#12412: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_5")[0i64].apply([], [])
            @Expect("assertion#12413: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_5")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12414: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_5")[0i64]
                .apply([TypeInfo.of<Int8>()], [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#12415: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_5")[0i64]
                .apply([], [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#12416: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_5")[0i64]
                .apply([], [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#12417: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_5")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#12418: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_5")[0i64].apply([TypeInfo.of<Int8>()], [()])
            @Expect("assertion#12419: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_5")[0i64].apply([], [()])
            @Expect("assertion#12420: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_5")[0i64].apply([], [()])
            @Expect("assertion#12421: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_5")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#12422: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }
}
