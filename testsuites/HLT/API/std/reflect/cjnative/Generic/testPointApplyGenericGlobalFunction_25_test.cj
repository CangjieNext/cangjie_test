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
class testPointApplyGenericGlobalFunction_25 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_556(): Unit {
        packageInfo
            .getFunctions("globalFunction_121")[0i64]
            .apply([TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Bool>()])
        try {
            packageInfo.getFunctions("globalFunction_121")[0i64].apply([], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#13863: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_121")[0i64].apply([], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#13864: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_121")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#13865: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_121")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#13866: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_121")[0i64].apply([], [])
            @Expect("assertion#13867: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_121")[0i64].apply([], [])
            @Expect("assertion#13868: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_121")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13869: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_121")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#13870: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_121")[0i64].apply([], [])
            @Expect("assertion#13871: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_121")[0i64].apply([], [])
            @Expect("assertion#13872: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_121")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13873: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_121")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#13874: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_121")[0i64]
                .apply([], [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#13875: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_121")[0i64]
                .apply([], [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#13876: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_121")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#13877: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_121")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#13878: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_121")[0i64].apply([], [()])
            @Expect("assertion#13879: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_121")[0i64].apply([], [()])
            @Expect("assertion#13880: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_121")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#13881: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_557(): Unit {
        packageInfo
            .getFunctions("globalFunction_122")[0i64]
            .apply([TypeInfo.of<Int16>()], [GenericClassWith1TypeParameters<Int8>()])
        try {
            packageInfo.getFunctions("globalFunction_122")[0i64].apply([], [GenericClassWith1TypeParameters<Int8>()])
            @Expect("assertion#13882: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_122")[0i64].apply([], [GenericClassWith1TypeParameters<Int8>()])
            @Expect("assertion#13883: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_122")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [GenericClassWith1TypeParameters<Int8>()])
            @Expect("assertion#13884: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_122")[0i64].apply([TypeInfo.of<Int16>()], [])
            @Expect("assertion#13885: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_122")[0i64].apply([], [])
            @Expect("assertion#13886: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_122")[0i64].apply([], [])
            @Expect("assertion#13887: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_122")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13888: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_122")[0i64].apply([TypeInfo.of<Int16>()], [])
            @Expect("assertion#13889: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_122")[0i64].apply([], [])
            @Expect("assertion#13890: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_122")[0i64].apply([], [])
            @Expect("assertion#13891: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_122")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13892: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_122")[0i64]
                .apply([TypeInfo.of<Int16>()], [GenericClassWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#13893: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_122")[0i64]
                .apply([], [GenericClassWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#13894: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_122")[0i64]
                .apply([], [GenericClassWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#13895: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_122")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#13896: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_122")[0i64].apply([TypeInfo.of<Int16>()], [()])
            @Expect("assertion#13897: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_122")[0i64].apply([], [()])
            @Expect("assertion#13898: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_122")[0i64].apply([], [()])
            @Expect("assertion#13899: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_122")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#13900: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_558(): Unit {
        packageInfo
            .getFunctions("globalFunction_123")[0i64]
            .apply([TypeInfo.of<UInt16>()], [GenericClassWith1TypeParameters<Int16>()])
        try {
            packageInfo.getFunctions("globalFunction_123")[0i64].apply([], [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#13901: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_123")[0i64].apply([], [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#13902: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_123")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#13903: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_123")[0i64].apply([TypeInfo.of<UInt16>()], [])
            @Expect("assertion#13904: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_123")[0i64].apply([], [])
            @Expect("assertion#13905: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_123")[0i64].apply([], [])
            @Expect("assertion#13906: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_123")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13907: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_123")[0i64].apply([TypeInfo.of<UInt16>()], [])
            @Expect("assertion#13908: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_123")[0i64].apply([], [])
            @Expect("assertion#13909: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_123")[0i64].apply([], [])
            @Expect("assertion#13910: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_123")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13911: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_123")[0i64]
                .apply([TypeInfo.of<UInt16>()], [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#13912: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_123")[0i64]
                .apply([], [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#13913: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_123")[0i64]
                .apply([], [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#13914: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_123")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#13915: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_123")[0i64].apply([TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#13916: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_123")[0i64].apply([], [()])
            @Expect("assertion#13917: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_123")[0i64].apply([], [()])
            @Expect("assertion#13918: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_123")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#13919: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_559(): Unit {
        packageInfo
            .getFunctions("globalFunction_124")[0i64]
            .apply([TypeInfo.of<Bool>()], [GenericClassWith1TypeParameters<Int32>()])
        try {
            packageInfo.getFunctions("globalFunction_124")[0i64].apply([], [GenericClassWith1TypeParameters<Int32>()])
            @Expect("assertion#13920: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_124")[0i64].apply([], [GenericClassWith1TypeParameters<Int32>()])
            @Expect("assertion#13921: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_124")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [GenericClassWith1TypeParameters<Int32>()])
            @Expect("assertion#13922: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_124")[0i64].apply([TypeInfo.of<Bool>()], [])
            @Expect("assertion#13923: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_124")[0i64].apply([], [])
            @Expect("assertion#13924: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_124")[0i64].apply([], [])
            @Expect("assertion#13925: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_124")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13926: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_124")[0i64].apply([TypeInfo.of<Bool>()], [])
            @Expect("assertion#13927: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_124")[0i64].apply([], [])
            @Expect("assertion#13928: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_124")[0i64].apply([], [])
            @Expect("assertion#13929: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_124")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13930: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_124")[0i64]
                .apply([TypeInfo.of<Bool>()], [GenericClassWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#13931: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_124")[0i64]
                .apply([], [GenericClassWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#13932: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_124")[0i64]
                .apply([], [GenericClassWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#13933: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_124")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#13934: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_124")[0i64].apply([TypeInfo.of<Bool>()], [()])
            @Expect("assertion#13935: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_124")[0i64].apply([], [()])
            @Expect("assertion#13936: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_124")[0i64].apply([], [()])
            @Expect("assertion#13937: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_124")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#13938: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_560(): Unit {
        packageInfo
            .getFunctions("globalFunction_125")[0i64]
            .apply([TypeInfo.of<Int32>()], [GenericClassWith1TypeParameters<Int64>()])
        try {
            packageInfo.getFunctions("globalFunction_125")[0i64].apply([], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#13939: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_125")[0i64].apply([], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#13940: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_125")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#13941: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_125")[0i64].apply([TypeInfo.of<Int32>()], [])
            @Expect("assertion#13942: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_125")[0i64].apply([], [])
            @Expect("assertion#13943: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_125")[0i64].apply([], [])
            @Expect("assertion#13944: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_125")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13945: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_125")[0i64].apply([TypeInfo.of<Int32>()], [])
            @Expect("assertion#13946: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_125")[0i64].apply([], [])
            @Expect("assertion#13947: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_125")[0i64].apply([], [])
            @Expect("assertion#13948: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_125")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13949: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_125")[0i64]
                .apply([TypeInfo.of<Int32>()], [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#13950: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_125")[0i64]
                .apply([], [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#13951: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_125")[0i64]
                .apply([], [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#13952: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_125")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#13953: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_125")[0i64].apply([TypeInfo.of<Int32>()], [()])
            @Expect("assertion#13954: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_125")[0i64].apply([], [()])
            @Expect("assertion#13955: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_125")[0i64].apply([], [()])
            @Expect("assertion#13956: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_125")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#13957: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }
}
