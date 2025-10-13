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
class testPointApplyGenericGlobalFunction_22 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_541(): Unit {
        packageInfo.getFunctions("globalFunction_106")[0i64].apply([TypeInfo.of<Int64>()], [123i64])
        try {
            packageInfo.getFunctions("globalFunction_106")[0i64].apply([], [123i64])
            @Expect("assertion#13578: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_106")[0i64].apply([], [123i64])
            @Expect("assertion#13579: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_106")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [123i64])
            @Expect("assertion#13580: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_106")[0i64].apply([TypeInfo.of<Int64>()], [])
            @Expect("assertion#13581: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_106")[0i64].apply([], [])
            @Expect("assertion#13582: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_106")[0i64].apply([], [])
            @Expect("assertion#13583: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_106")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13584: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_106")[0i64].apply([TypeInfo.of<Int64>()], [])
            @Expect("assertion#13585: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_106")[0i64].apply([], [])
            @Expect("assertion#13586: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_106")[0i64].apply([], [])
            @Expect("assertion#13587: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_106")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13588: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_106")[0i64].apply([TypeInfo.of<Int64>()], [123i64, 114.514000f64])
            @Expect("assertion#13589: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_106")[0i64].apply([], [123i64, 114.514000f64])
            @Expect("assertion#13590: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_106")[0i64].apply([], [123i64, 114.514000f64])
            @Expect("assertion#13591: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_106")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [123i64, 114.514000f64])
            @Expect("assertion#13592: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_106")[0i64].apply([TypeInfo.of<Int64>()], [114.514000f64])
            @Expect("assertion#13593: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_106")[0i64].apply([], [114.514000f64])
            @Expect("assertion#13594: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_106")[0i64].apply([], [114.514000f64])
            @Expect("assertion#13595: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_106")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [114.514000f64])
            @Expect("assertion#13596: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_542(): Unit {
        packageInfo.getFunctions("globalFunction_107")[0i64].apply([TypeInfo.of<Int32>()], [NonGenericClass()])
        try {
            packageInfo.getFunctions("globalFunction_107")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#13597: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_107")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#13598: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_107")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [NonGenericClass()])
            @Expect("assertion#13599: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_107")[0i64].apply([TypeInfo.of<Int32>()], [])
            @Expect("assertion#13600: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_107")[0i64].apply([], [])
            @Expect("assertion#13601: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_107")[0i64].apply([], [])
            @Expect("assertion#13602: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_107")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13603: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_107")[0i64].apply([TypeInfo.of<Int32>()], [])
            @Expect("assertion#13604: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_107")[0i64].apply([], [])
            @Expect("assertion#13605: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_107")[0i64].apply([], [])
            @Expect("assertion#13606: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_107")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13607: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_107")[0i64]
                .apply([TypeInfo.of<Int32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13608: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_107")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13609: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_107")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13610: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_107")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13611: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_107")[0i64].apply([TypeInfo.of<Int32>()], [()])
            @Expect("assertion#13612: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_107")[0i64].apply([], [()])
            @Expect("assertion#13613: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_107")[0i64].apply([], [()])
            @Expect("assertion#13614: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_107")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#13615: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_543(): Unit {
        packageInfo.getFunctions("globalFunction_108")[0i64].apply([TypeInfo.of<Bool>()], [NonGenericClass()])
        try {
            packageInfo.getFunctions("globalFunction_108")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#13616: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_108")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#13617: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_108")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [NonGenericClass()])
            @Expect("assertion#13618: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_108")[0i64].apply([TypeInfo.of<Bool>()], [])
            @Expect("assertion#13619: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_108")[0i64].apply([], [])
            @Expect("assertion#13620: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_108")[0i64].apply([], [])
            @Expect("assertion#13621: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_108")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13622: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_108")[0i64].apply([TypeInfo.of<Bool>()], [])
            @Expect("assertion#13623: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_108")[0i64].apply([], [])
            @Expect("assertion#13624: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_108")[0i64].apply([], [])
            @Expect("assertion#13625: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_108")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13626: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_108")[0i64]
                .apply([TypeInfo.of<Bool>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13627: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_108")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13628: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_108")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13629: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_108")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13630: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_108")[0i64].apply([TypeInfo.of<Bool>()], [()])
            @Expect("assertion#13631: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_108")[0i64].apply([], [()])
            @Expect("assertion#13632: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_108")[0i64].apply([], [()])
            @Expect("assertion#13633: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_108")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#13634: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_544(): Unit {
        packageInfo.getFunctions("globalFunction_109")[0i64].apply([TypeInfo.of<Unit>()], [NonGenericClass()])
        try {
            packageInfo.getFunctions("globalFunction_109")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#13635: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_109")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#13636: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_109")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [NonGenericClass()])
            @Expect("assertion#13637: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_109")[0i64].apply([TypeInfo.of<Unit>()], [])
            @Expect("assertion#13638: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_109")[0i64].apply([], [])
            @Expect("assertion#13639: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_109")[0i64].apply([], [])
            @Expect("assertion#13640: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_109")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13641: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_109")[0i64].apply([TypeInfo.of<Unit>()], [])
            @Expect("assertion#13642: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_109")[0i64].apply([], [])
            @Expect("assertion#13643: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_109")[0i64].apply([], [])
            @Expect("assertion#13644: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_109")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13645: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_109")[0i64]
                .apply([TypeInfo.of<Unit>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13646: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_109")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13647: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_109")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13648: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_109")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13649: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_109")[0i64].apply([TypeInfo.of<Unit>()], [()])
            @Expect("assertion#13650: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_109")[0i64].apply([], [()])
            @Expect("assertion#13651: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_109")[0i64].apply([], [()])
            @Expect("assertion#13652: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_109")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#13653: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_545(): Unit {
        packageInfo.getFunctions("globalFunction_110")[0i64].apply([TypeInfo.of<UInt16>()], [NonGenericClass()])
        try {
            packageInfo.getFunctions("globalFunction_110")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#13654: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_110")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#13655: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_110")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [NonGenericClass()])
            @Expect("assertion#13656: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_110")[0i64].apply([TypeInfo.of<UInt16>()], [])
            @Expect("assertion#13657: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_110")[0i64].apply([], [])
            @Expect("assertion#13658: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_110")[0i64].apply([], [])
            @Expect("assertion#13659: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_110")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13660: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_110")[0i64].apply([TypeInfo.of<UInt16>()], [])
            @Expect("assertion#13661: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_110")[0i64].apply([], [])
            @Expect("assertion#13662: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_110")[0i64].apply([], [])
            @Expect("assertion#13663: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_110")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13664: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_110")[0i64]
                .apply([TypeInfo.of<UInt16>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13665: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_110")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13666: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_110")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13667: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_110")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13668: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_110")[0i64].apply([TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#13669: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_110")[0i64].apply([], [()])
            @Expect("assertion#13670: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_110")[0i64].apply([], [()])
            @Expect("assertion#13671: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_110")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#13672: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }
}
