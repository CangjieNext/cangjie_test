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
class testPointApplyGenericGlobalFunction_34 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_601(): Unit {
        packageInfo
            .getFunctions("globalFunction_166")[0i64]
            .apply([TypeInfo.of<Unit>()], [GenericStructWith1TypeParameters<UInt16>()])
        try {
            packageInfo.getFunctions("globalFunction_166")[0i64].apply([], [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#14718: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_166")[0i64].apply([], [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#14719: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_166")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#14720: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_166")[0i64].apply([TypeInfo.of<Unit>()], [])
            @Expect("assertion#14721: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_166")[0i64].apply([], [])
            @Expect("assertion#14722: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_166")[0i64].apply([], [])
            @Expect("assertion#14723: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_166")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#14724: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_166")[0i64].apply([TypeInfo.of<Unit>()], [])
            @Expect("assertion#14725: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_166")[0i64].apply([], [])
            @Expect("assertion#14726: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_166")[0i64].apply([], [])
            @Expect("assertion#14727: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_166")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#14728: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_166")[0i64]
                .apply([TypeInfo.of<Unit>()], [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#14729: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_166")[0i64]
                .apply([], [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#14730: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_166")[0i64]
                .apply([], [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#14731: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_166")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#14732: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_166")[0i64].apply([TypeInfo.of<Unit>()], [()])
            @Expect("assertion#14733: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_166")[0i64].apply([], [()])
            @Expect("assertion#14734: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_166")[0i64].apply([], [()])
            @Expect("assertion#14735: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_166")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#14736: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_602(): Unit {
        packageInfo
            .getFunctions("globalFunction_167")[0i64]
            .apply([TypeInfo.of<UInt8>()], [GenericStructWith1TypeParameters<UInt32>()])
        try {
            packageInfo.getFunctions("globalFunction_167")[0i64].apply([], [GenericStructWith1TypeParameters<UInt32>()])
            @Expect("assertion#14737: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_167")[0i64].apply([], [GenericStructWith1TypeParameters<UInt32>()])
            @Expect("assertion#14738: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_167")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [GenericStructWith1TypeParameters<UInt32>()])
            @Expect("assertion#14739: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_167")[0i64].apply([TypeInfo.of<UInt8>()], [])
            @Expect("assertion#14740: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_167")[0i64].apply([], [])
            @Expect("assertion#14741: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_167")[0i64].apply([], [])
            @Expect("assertion#14742: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_167")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#14743: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_167")[0i64].apply([TypeInfo.of<UInt8>()], [])
            @Expect("assertion#14744: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_167")[0i64].apply([], [])
            @Expect("assertion#14745: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_167")[0i64].apply([], [])
            @Expect("assertion#14746: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_167")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#14747: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_167")[0i64]
                .apply([TypeInfo.of<UInt8>()], [GenericStructWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#14748: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_167")[0i64]
                .apply([], [GenericStructWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#14749: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_167")[0i64]
                .apply([], [GenericStructWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#14750: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_167")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#14751: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_167")[0i64].apply([TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#14752: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_167")[0i64].apply([], [()])
            @Expect("assertion#14753: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_167")[0i64].apply([], [()])
            @Expect("assertion#14754: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_167")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#14755: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_603(): Unit {
        packageInfo
            .getFunctions("globalFunction_168")[0i64]
            .apply([TypeInfo.of<UInt64>()], [GenericStructWith1TypeParameters<UInt64>()])
        try {
            packageInfo.getFunctions("globalFunction_168")[0i64].apply([], [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#14756: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_168")[0i64].apply([], [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#14757: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_168")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#14758: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_168")[0i64].apply([TypeInfo.of<UInt64>()], [])
            @Expect("assertion#14759: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_168")[0i64].apply([], [])
            @Expect("assertion#14760: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_168")[0i64].apply([], [])
            @Expect("assertion#14761: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_168")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#14762: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_168")[0i64].apply([TypeInfo.of<UInt64>()], [])
            @Expect("assertion#14763: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_168")[0i64].apply([], [])
            @Expect("assertion#14764: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_168")[0i64].apply([], [])
            @Expect("assertion#14765: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_168")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#14766: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_168")[0i64]
                .apply([TypeInfo.of<UInt64>()], [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#14767: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_168")[0i64]
                .apply([], [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#14768: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_168")[0i64]
                .apply([], [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#14769: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_168")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#14770: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_168")[0i64].apply([TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#14771: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_168")[0i64].apply([], [()])
            @Expect("assertion#14772: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_168")[0i64].apply([], [()])
            @Expect("assertion#14773: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_168")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#14774: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_604(): Unit {
        packageInfo
            .getFunctions("globalFunction_169")[0i64]
            .apply([TypeInfo.of<UInt8>()], [GenericStructWith1TypeParameters<Float32>()])
        try {
            packageInfo
                .getFunctions("globalFunction_169")[0i64]
                .apply([], [GenericStructWith1TypeParameters<Float32>()])
            @Expect("assertion#14775: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_169")[0i64]
                .apply([], [GenericStructWith1TypeParameters<Float32>()])
            @Expect("assertion#14776: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_169")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [GenericStructWith1TypeParameters<Float32>()])
            @Expect("assertion#14777: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_169")[0i64].apply([TypeInfo.of<UInt8>()], [])
            @Expect("assertion#14778: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_169")[0i64].apply([], [])
            @Expect("assertion#14779: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_169")[0i64].apply([], [])
            @Expect("assertion#14780: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_169")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#14781: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_169")[0i64].apply([TypeInfo.of<UInt8>()], [])
            @Expect("assertion#14782: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_169")[0i64].apply([], [])
            @Expect("assertion#14783: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_169")[0i64].apply([], [])
            @Expect("assertion#14784: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_169")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#14785: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_169")[0i64]
                .apply([TypeInfo.of<UInt8>()], [GenericStructWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#14786: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_169")[0i64]
                .apply([], [GenericStructWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#14787: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_169")[0i64]
                .apply([], [GenericStructWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#14788: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_169")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#14789: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_169")[0i64].apply([TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#14790: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_169")[0i64].apply([], [()])
            @Expect("assertion#14791: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_169")[0i64].apply([], [()])
            @Expect("assertion#14792: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_169")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#14793: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_605(): Unit {
        packageInfo
            .getFunctions("globalFunction_170")[0i64]
            .apply([TypeInfo.of<UInt64>()], [GenericStructWith1TypeParameters<Float64>()])
        try {
            packageInfo
                .getFunctions("globalFunction_170")[0i64]
                .apply([], [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#14794: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_170")[0i64]
                .apply([], [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#14795: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_170")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#14796: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_170")[0i64].apply([TypeInfo.of<UInt64>()], [])
            @Expect("assertion#14797: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_170")[0i64].apply([], [])
            @Expect("assertion#14798: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_170")[0i64].apply([], [])
            @Expect("assertion#14799: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_170")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#14800: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_170")[0i64].apply([TypeInfo.of<UInt64>()], [])
            @Expect("assertion#14801: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_170")[0i64].apply([], [])
            @Expect("assertion#14802: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_170")[0i64].apply([], [])
            @Expect("assertion#14803: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_170")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#14804: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_170")[0i64]
                .apply([TypeInfo.of<UInt64>()], [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#14805: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_170")[0i64]
                .apply([], [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#14806: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_170")[0i64]
                .apply([], [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#14807: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_170")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#14808: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_170")[0i64].apply([TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#14809: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_170")[0i64].apply([], [()])
            @Expect("assertion#14810: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_170")[0i64].apply([], [()])
            @Expect("assertion#14811: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_170")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#14812: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }
}
