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
class testPointApplyGenericGlobalFunction_40 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_631(): Unit {
        packageInfo
            .getFunctions("globalFunction_196")[0i64]
            .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [114.514000f64])
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [114.514000f64])
            @Expect("assertion#15288: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [114.514000f64])
            @Expect("assertion#15289: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#15290: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15291: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15292: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_196")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15293: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15294: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15295: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15296: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_196")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15297: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15298: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()],
                    [114.514000f64, 114.514000f64])
            @Expect("assertion#15299: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [114.514000f64, 114.514000f64])
            @Expect("assertion#15300: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [114.514000f64, 114.514000f64])
            @Expect("assertion#15301: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, 114.514000f64])
            @Expect("assertion#15302: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#15303: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#15304: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#15305: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#15306: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_632(): Unit {
        packageInfo
            .getFunctions("globalFunction_197")[0i64]
            .apply([TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [1i16])
        try {
            packageInfo
                .getFunctions("globalFunction_197")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [1i16])
            @Expect("assertion#15307: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_197")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Unit>()], [1i16])
            @Expect("assertion#15308: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_197")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [1i16])
            @Expect("assertion#15309: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_197")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15310: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_197")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15311: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_197")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#15312: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_197")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15313: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_197")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15314: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_197")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15315: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_197")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#15316: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_197")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15317: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_197")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [1i16, 114.514000f64])
            @Expect("assertion#15318: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_197")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [1i16, 114.514000f64])
            @Expect("assertion#15319: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_197")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Unit>()], [1i16, 114.514000f64])
            @Expect("assertion#15320: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_197")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [1i16, 114.514000f64])
            @Expect("assertion#15321: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_197")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [114.514000f64])
            @Expect("assertion#15322: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_197")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int64>()], [114.514000f64])
            @Expect("assertion#15323: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_197")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Unit>()], [114.514000f64])
            @Expect("assertion#15324: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_197")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Unit>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#15325: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_633(): Unit {
        packageInfo
            .getFunctions("globalFunction_198")[0i64]
            .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [1u16])
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [1u16])
            @Expect("assertion#15326: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [1u16])
            @Expect("assertion#15327: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [1u16])
            @Expect("assertion#15328: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15329: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_198")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15330: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_198")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15331: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15332: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15333: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_198")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15334: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_198")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15335: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15336: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [1u16, 114.514000f64])
            @Expect("assertion#15337: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [1u16, 114.514000f64])
            @Expect("assertion#15338: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [1u16, 114.514000f64])
            @Expect("assertion#15339: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [1u16, 114.514000f64])
            @Expect("assertion#15340: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [114.514000f64])
            @Expect("assertion#15341: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [114.514000f64])
            @Expect("assertion#15342: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [114.514000f64])
            @Expect("assertion#15343: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#15344: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_634(): Unit {
        packageInfo
            .getFunctions("globalFunction_199")[0i64]
            .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [1i8])
        try {
            packageInfo.getFunctions("globalFunction_199")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [1i8])
            @Expect("assertion#15345: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_199")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [1i8])
            @Expect("assertion#15346: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_199")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [1i8])
            @Expect("assertion#15347: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_199")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15348: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_199")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15349: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_199")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#15350: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_199")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15351: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_199")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15352: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_199")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15353: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_199")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#15354: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_199")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15355: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_199")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [1i8, 114.514000f64])
            @Expect("assertion#15356: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_199")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [1i8, 114.514000f64])
            @Expect("assertion#15357: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_199")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [1i8, 114.514000f64])
            @Expect("assertion#15358: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_199")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [1i8, 114.514000f64])
            @Expect("assertion#15359: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_199")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [114.514000f64])
            @Expect("assertion#15360: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_199")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [114.514000f64])
            @Expect("assertion#15361: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_199")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [114.514000f64])
            @Expect("assertion#15362: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_199")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#15363: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_635(): Unit {
        packageInfo
            .getFunctions("globalFunction_200")[0i64]
            .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [NonGenericClass()])
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [NonGenericClass()])
            @Expect("assertion#15364: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [NonGenericClass()])
            @Expect("assertion#15365: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#15366: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15367: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15368: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15369: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15370: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15371: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15372: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15373: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15374: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15375: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15376: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15377: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15378: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#15379: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#15380: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15381: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#15382: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }
}
