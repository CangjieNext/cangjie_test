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
class testPointApplyGenericGlobalFunction_26 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_561(): Unit {
        packageInfo
            .getFunctions("globalFunction_126")[0i64]
            .apply([TypeInfo.of<Int8>()], [GenericClassWith1TypeParameters<UInt8>()])
        try {
            packageInfo.getFunctions("globalFunction_126")[0i64].apply([], [GenericClassWith1TypeParameters<UInt8>()])
            @Expect("assertion#13958: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_126")[0i64].apply([], [GenericClassWith1TypeParameters<UInt8>()])
            @Expect("assertion#13959: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_126")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [GenericClassWith1TypeParameters<UInt8>()])
            @Expect("assertion#13960: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_126")[0i64].apply([TypeInfo.of<Int8>()], [])
            @Expect("assertion#13961: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_126")[0i64].apply([], [])
            @Expect("assertion#13962: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_126")[0i64].apply([], [])
            @Expect("assertion#13963: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_126")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13964: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_126")[0i64].apply([TypeInfo.of<Int8>()], [])
            @Expect("assertion#13965: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_126")[0i64].apply([], [])
            @Expect("assertion#13966: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_126")[0i64].apply([], [])
            @Expect("assertion#13967: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_126")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13968: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_126")[0i64]
                .apply([TypeInfo.of<Int8>()], [GenericClassWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#13969: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_126")[0i64]
                .apply([], [GenericClassWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#13970: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_126")[0i64]
                .apply([], [GenericClassWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#13971: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_126")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#13972: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_126")[0i64].apply([TypeInfo.of<Int8>()], [()])
            @Expect("assertion#13973: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_126")[0i64].apply([], [()])
            @Expect("assertion#13974: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_126")[0i64].apply([], [()])
            @Expect("assertion#13975: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_126")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#13976: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_562(): Unit {
        packageInfo
            .getFunctions("globalFunction_127")[0i64]
            .apply([TypeInfo.of<Int64>()], [GenericClassWith1TypeParameters<UInt16>()])
        try {
            packageInfo.getFunctions("globalFunction_127")[0i64].apply([], [GenericClassWith1TypeParameters<UInt16>()])
            @Expect("assertion#13977: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_127")[0i64].apply([], [GenericClassWith1TypeParameters<UInt16>()])
            @Expect("assertion#13978: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_127")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [GenericClassWith1TypeParameters<UInt16>()])
            @Expect("assertion#13979: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_127")[0i64].apply([TypeInfo.of<Int64>()], [])
            @Expect("assertion#13980: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_127")[0i64].apply([], [])
            @Expect("assertion#13981: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_127")[0i64].apply([], [])
            @Expect("assertion#13982: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_127")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13983: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_127")[0i64].apply([TypeInfo.of<Int64>()], [])
            @Expect("assertion#13984: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_127")[0i64].apply([], [])
            @Expect("assertion#13985: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_127")[0i64].apply([], [])
            @Expect("assertion#13986: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_127")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13987: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_127")[0i64]
                .apply([TypeInfo.of<Int64>()], [GenericClassWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#13988: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_127")[0i64]
                .apply([], [GenericClassWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#13989: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_127")[0i64]
                .apply([], [GenericClassWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#13990: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_127")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#13991: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_127")[0i64].apply([TypeInfo.of<Int64>()], [()])
            @Expect("assertion#13992: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_127")[0i64].apply([], [()])
            @Expect("assertion#13993: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_127")[0i64].apply([], [()])
            @Expect("assertion#13994: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_127")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#13995: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_563(): Unit {
        packageInfo
            .getFunctions("globalFunction_128")[0i64]
            .apply([TypeInfo.of<Int64>()], [GenericClassWith1TypeParameters<UInt32>()])
        try {
            packageInfo.getFunctions("globalFunction_128")[0i64].apply([], [GenericClassWith1TypeParameters<UInt32>()])
            @Expect("assertion#13996: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_128")[0i64].apply([], [GenericClassWith1TypeParameters<UInt32>()])
            @Expect("assertion#13997: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_128")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [GenericClassWith1TypeParameters<UInt32>()])
            @Expect("assertion#13998: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_128")[0i64].apply([TypeInfo.of<Int64>()], [])
            @Expect("assertion#13999: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_128")[0i64].apply([], [])
            @Expect("assertion#14000: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_128")[0i64].apply([], [])
            @Expect("assertion#14001: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_128")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#14002: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_128")[0i64].apply([TypeInfo.of<Int64>()], [])
            @Expect("assertion#14003: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_128")[0i64].apply([], [])
            @Expect("assertion#14004: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_128")[0i64].apply([], [])
            @Expect("assertion#14005: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_128")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#14006: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_128")[0i64]
                .apply([TypeInfo.of<Int64>()], [GenericClassWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#14007: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_128")[0i64]
                .apply([], [GenericClassWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#14008: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_128")[0i64]
                .apply([], [GenericClassWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#14009: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_128")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#14010: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_128")[0i64].apply([TypeInfo.of<Int64>()], [()])
            @Expect("assertion#14011: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_128")[0i64].apply([], [()])
            @Expect("assertion#14012: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_128")[0i64].apply([], [()])
            @Expect("assertion#14013: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_128")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#14014: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_564(): Unit {
        packageInfo
            .getFunctions("globalFunction_129")[0i64]
            .apply([TypeInfo.of<Unit>()], [GenericClassWith1TypeParameters<UInt64>()])
        try {
            packageInfo.getFunctions("globalFunction_129")[0i64].apply([], [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#14015: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_129")[0i64].apply([], [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#14016: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_129")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [GenericClassWith1TypeParameters<UInt64>()])
            @Expect("assertion#14017: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_129")[0i64].apply([TypeInfo.of<Unit>()], [])
            @Expect("assertion#14018: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_129")[0i64].apply([], [])
            @Expect("assertion#14019: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_129")[0i64].apply([], [])
            @Expect("assertion#14020: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_129")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#14021: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_129")[0i64].apply([TypeInfo.of<Unit>()], [])
            @Expect("assertion#14022: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_129")[0i64].apply([], [])
            @Expect("assertion#14023: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_129")[0i64].apply([], [])
            @Expect("assertion#14024: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_129")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#14025: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_129")[0i64]
                .apply([TypeInfo.of<Unit>()], [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#14026: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_129")[0i64]
                .apply([], [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#14027: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_129")[0i64]
                .apply([], [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#14028: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_129")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#14029: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_129")[0i64].apply([TypeInfo.of<Unit>()], [()])
            @Expect("assertion#14030: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_129")[0i64].apply([], [()])
            @Expect("assertion#14031: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_129")[0i64].apply([], [()])
            @Expect("assertion#14032: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_129")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#14033: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_565(): Unit {
        packageInfo
            .getFunctions("globalFunction_130")[0i64]
            .apply([TypeInfo.of<Float64>()], [GenericClassWith1TypeParameters<Float32>()])
        try {
            packageInfo.getFunctions("globalFunction_130")[0i64].apply([], [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#14034: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_130")[0i64].apply([], [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#14035: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_130")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#14036: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_130")[0i64].apply([TypeInfo.of<Float64>()], [])
            @Expect("assertion#14037: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_130")[0i64].apply([], [])
            @Expect("assertion#14038: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_130")[0i64].apply([], [])
            @Expect("assertion#14039: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_130")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#14040: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_130")[0i64].apply([TypeInfo.of<Float64>()], [])
            @Expect("assertion#14041: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_130")[0i64].apply([], [])
            @Expect("assertion#14042: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_130")[0i64].apply([], [])
            @Expect("assertion#14043: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_130")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#14044: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_130")[0i64]
                .apply([TypeInfo.of<Float64>()], [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#14045: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_130")[0i64]
                .apply([], [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#14046: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_130")[0i64]
                .apply([], [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#14047: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_130")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#14048: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_130")[0i64].apply([TypeInfo.of<Float64>()], [()])
            @Expect("assertion#14049: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_130")[0i64].apply([], [()])
            @Expect("assertion#14050: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_130")[0i64].apply([], [()])
            @Expect("assertion#14051: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_130")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#14052: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }
}
