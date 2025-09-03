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
class testPointApplyGenericGlobalFunction_55 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_706(): Unit {
        packageInfo
            .getFunctions("globalFunction_271")[0i64]
            .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                [GenericStructWith1TypeParameters<Float64>()])
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#16713: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#16714: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#16715: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#16716: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_271")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#16717: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_271")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#16718: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16719: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#16720: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_271")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#16721: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_271")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#16722: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16723: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#16724: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#16725: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#16726: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#16727: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#16728: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_271")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#16729: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#16730: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16731: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_707(): Unit {
        packageInfo
            .getFunctions("globalFunction_272")[0i64]
            .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()],
                [GenericStructWith1TypeParameters<Float64>()])
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#16732: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#16733: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#16734: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#16735: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_272")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#16736: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#16737: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16738: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#16739: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_272")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#16740: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#16741: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16742: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#16743: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#16744: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#16745: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#16746: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#16747: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#16748: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#16749: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#16750: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_708(): Unit {
        packageInfo
            .getFunctions("globalFunction_273")[0i64]
            .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()],
                [GenericStructWith1TypeParameters<Int64>()])
        try {
            packageInfo
                .getFunctions("globalFunction_273")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#16751: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_273")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#16752: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_273")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#16753: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_273")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#16754: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_273")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#16755: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_273")[0i64].apply([TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#16756: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_273")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16757: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_273")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#16758: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_273")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#16759: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_273")[0i64].apply([TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#16760: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_273")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16761: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_273")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#16762: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_273")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#16763: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_273")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#16764: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_273")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#16765: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_273")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#16766: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_273")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#16767: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_273")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#16768: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_273")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16769: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_709(): Unit {
        packageInfo
            .getFunctions("globalFunction_274")[0i64]
            .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>()],
                [GenericStructWith1TypeParameters<Int32>()])
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#16770: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#16771: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#16772: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#16773: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_274")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#16774: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_274")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16775: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16776: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#16777: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_274")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#16778: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_274")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16779: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16780: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>()],
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#16781: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()],
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#16782: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#16783: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#16784: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#16785: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#16786: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_274")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#16787: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16788: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_710(): Unit {
        packageInfo
            .getFunctions("globalFunction_275")[0i64]
            .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                [GenericStructWith2TypeParameters<Unit, Unit>()])
        try {
            packageInfo
                .getFunctions("globalFunction_275")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#16789: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_275")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#16790: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_275")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>()])
            @Expect("assertion#16791: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_275")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#16792: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_275")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#16793: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_275")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#16794: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_275")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16795: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_275")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#16796: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_275")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#16797: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_275")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#16798: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_275")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16799: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_275")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#16800: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_275")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#16801: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_275")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#16802: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_275")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Unit, Unit>(), 114.514000f64])
            @Expect("assertion#16803: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_275")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#16804: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_275")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#16805: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_275")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#16806: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_275")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#16807: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }
}
