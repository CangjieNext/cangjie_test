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
class testPointApplyGenericGlobalFunction_43 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_646(): Unit {
        packageInfo
            .getFunctions("globalFunction_211")[0i64]
            .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [NonGenericClass()])
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [NonGenericClass()])
            @Expect("assertion#15573: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [NonGenericClass()])
            @Expect("assertion#15574: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#15575: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15576: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15577: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15578: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15579: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15580: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15581: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15582: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15583: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15584: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15585: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15586: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15587: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#15588: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#15589: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15590: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#15591: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_647(): Unit {
        packageInfo
            .getFunctions("globalFunction_212")[0i64]
            .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [NonGenericClass()])
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [NonGenericClass()])
            @Expect("assertion#15592: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [NonGenericClass()])
            @Expect("assertion#15593: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#15594: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15595: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_212")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15596: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_212")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#15597: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15598: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15599: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_212")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15600: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_212")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#15601: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15602: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15603: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15604: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15605: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15606: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#15607: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_212")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#15608: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#15609: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15610: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_648(): Unit {
        packageInfo
            .getFunctions("globalFunction_213")[0i64]
            .apply([TypeInfo.of<Float32>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [NonGenericClass()])
        try {
            packageInfo
                .getFunctions("globalFunction_213")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [NonGenericClass()])
            @Expect("assertion#15611: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_213")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#15612: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_213")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#15613: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_213")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15614: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_213")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15615: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_213")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#15616: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_213")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#15617: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_213")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15618: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_213")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15619: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_213")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#15620: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_213")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#15621: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_213")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15622: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_213")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15623: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_213")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15624: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_213")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15625: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_213")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#15626: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_213")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#15627: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_213")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#15628: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_213")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#15629: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_649(): Unit {
        packageInfo
            .getFunctions("globalFunction_214")[0i64]
            .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [NonGenericClass()])
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#15630: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [NonGenericClass()])
            @Expect("assertion#15631: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#15632: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#15633: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_214")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#15634: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_214")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15635: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15636: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#15637: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_214")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#15638: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_214")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15639: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15640: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15641: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15642: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15643: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15644: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#15645: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#15646: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_214")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#15647: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15648: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_650(): Unit {
        packageInfo
            .getFunctions("globalFunction_215")[0i64]
            .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()],
                [GenericClassWith1TypeParameters<Unit>()])
        try {
            packageInfo
                .getFunctions("globalFunction_215")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#15649: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_215")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#15650: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_215")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#15651: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_215")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15652: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_215")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15653: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_215")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#15654: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_215")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15655: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_215")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15656: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_215")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15657: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_215")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#15658: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_215")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15659: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_215")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#15660: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_215")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#15661: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_215")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#15662: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_215")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#15663: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_215")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#15664: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_215")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#15665: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_215")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#15666: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_215")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15667: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }
}
