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
class testPointApplyGenericGlobalFunction_24 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_551(): Unit {
        packageInfo.getFunctions("globalFunction_116")[0i64].apply([TypeInfo.of<Int8>()], [NonGenericClass()])
        try {
            packageInfo.getFunctions("globalFunction_116")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#13768: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_116")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#13769: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_116")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [NonGenericClass()])
            @Expect("assertion#13770: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_116")[0i64].apply([TypeInfo.of<Int8>()], [])
            @Expect("assertion#13771: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_116")[0i64].apply([], [])
            @Expect("assertion#13772: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_116")[0i64].apply([], [])
            @Expect("assertion#13773: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_116")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13774: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_116")[0i64].apply([TypeInfo.of<Int8>()], [])
            @Expect("assertion#13775: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_116")[0i64].apply([], [])
            @Expect("assertion#13776: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_116")[0i64].apply([], [])
            @Expect("assertion#13777: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_116")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13778: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_116")[0i64]
                .apply([TypeInfo.of<Int8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13779: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_116")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13780: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_116")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13781: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_116")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13782: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_116")[0i64].apply([TypeInfo.of<Int8>()], [()])
            @Expect("assertion#13783: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_116")[0i64].apply([], [()])
            @Expect("assertion#13784: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_116")[0i64].apply([], [()])
            @Expect("assertion#13785: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_116")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#13786: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_552(): Unit {
        packageInfo.getFunctions("globalFunction_117")[0i64].apply([TypeInfo.of<Int8>()], [NonGenericClass()])
        try {
            packageInfo.getFunctions("globalFunction_117")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#13787: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_117")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#13788: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_117")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [NonGenericClass()])
            @Expect("assertion#13789: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_117")[0i64].apply([TypeInfo.of<Int8>()], [])
            @Expect("assertion#13790: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_117")[0i64].apply([], [])
            @Expect("assertion#13791: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_117")[0i64].apply([], [])
            @Expect("assertion#13792: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_117")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13793: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_117")[0i64].apply([TypeInfo.of<Int8>()], [])
            @Expect("assertion#13794: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_117")[0i64].apply([], [])
            @Expect("assertion#13795: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_117")[0i64].apply([], [])
            @Expect("assertion#13796: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_117")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13797: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_117")[0i64]
                .apply([TypeInfo.of<Int8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13798: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_117")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13799: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_117")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13800: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_117")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13801: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_117")[0i64].apply([TypeInfo.of<Int8>()], [()])
            @Expect("assertion#13802: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_117")[0i64].apply([], [()])
            @Expect("assertion#13803: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_117")[0i64].apply([], [()])
            @Expect("assertion#13804: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_117")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#13805: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_553(): Unit {
        packageInfo.getFunctions("globalFunction_118")[0i64].apply([TypeInfo.of<Int16>()], [NonGenericClass()])
        try {
            packageInfo.getFunctions("globalFunction_118")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#13806: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_118")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#13807: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_118")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [NonGenericClass()])
            @Expect("assertion#13808: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_118")[0i64].apply([TypeInfo.of<Int16>()], [])
            @Expect("assertion#13809: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_118")[0i64].apply([], [])
            @Expect("assertion#13810: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_118")[0i64].apply([], [])
            @Expect("assertion#13811: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_118")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13812: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_118")[0i64].apply([TypeInfo.of<Int16>()], [])
            @Expect("assertion#13813: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_118")[0i64].apply([], [])
            @Expect("assertion#13814: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_118")[0i64].apply([], [])
            @Expect("assertion#13815: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_118")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13816: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_118")[0i64]
                .apply([TypeInfo.of<Int16>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13817: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_118")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13818: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_118")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13819: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_118")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13820: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_118")[0i64].apply([TypeInfo.of<Int16>()], [()])
            @Expect("assertion#13821: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_118")[0i64].apply([], [()])
            @Expect("assertion#13822: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_118")[0i64].apply([], [()])
            @Expect("assertion#13823: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_118")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#13824: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_554(): Unit {
        packageInfo.getFunctions("globalFunction_119")[0i64].apply([TypeInfo.of<Int8>()], [NonGenericClass()])
        try {
            packageInfo.getFunctions("globalFunction_119")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#13825: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_119")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#13826: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_119")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [NonGenericClass()])
            @Expect("assertion#13827: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_119")[0i64].apply([TypeInfo.of<Int8>()], [])
            @Expect("assertion#13828: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_119")[0i64].apply([], [])
            @Expect("assertion#13829: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_119")[0i64].apply([], [])
            @Expect("assertion#13830: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_119")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13831: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_119")[0i64].apply([TypeInfo.of<Int8>()], [])
            @Expect("assertion#13832: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_119")[0i64].apply([], [])
            @Expect("assertion#13833: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_119")[0i64].apply([], [])
            @Expect("assertion#13834: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_119")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13835: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_119")[0i64]
                .apply([TypeInfo.of<Int8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13836: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_119")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13837: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_119")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13838: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_119")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#13839: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_119")[0i64].apply([TypeInfo.of<Int8>()], [()])
            @Expect("assertion#13840: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_119")[0i64].apply([], [()])
            @Expect("assertion#13841: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_119")[0i64].apply([], [()])
            @Expect("assertion#13842: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_119")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#13843: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_555(): Unit {
        packageInfo
            .getFunctions("globalFunction_120")[0i64]
            .apply([TypeInfo.of<Float64>()], [GenericClassWith1TypeParameters<Unit>()])
        try {
            packageInfo.getFunctions("globalFunction_120")[0i64].apply([], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#13844: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_120")[0i64].apply([], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#13845: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_120")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#13846: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_120")[0i64].apply([TypeInfo.of<Float64>()], [])
            @Expect("assertion#13847: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_120")[0i64].apply([], [])
            @Expect("assertion#13848: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_120")[0i64].apply([], [])
            @Expect("assertion#13849: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_120")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13850: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_120")[0i64].apply([TypeInfo.of<Float64>()], [])
            @Expect("assertion#13851: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_120")[0i64].apply([], [])
            @Expect("assertion#13852: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_120")[0i64].apply([], [])
            @Expect("assertion#13853: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_120")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#13854: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_120")[0i64]
                .apply([TypeInfo.of<Float64>()], [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#13855: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_120")[0i64]
                .apply([], [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#13856: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_120")[0i64]
                .apply([], [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#13857: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_120")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#13858: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_120")[0i64].apply([TypeInfo.of<Float64>()], [()])
            @Expect("assertion#13859: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_120")[0i64].apply([], [()])
            @Expect("assertion#13860: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_120")[0i64].apply([], [()])
            @Expect("assertion#13861: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_120")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#13862: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }
}
