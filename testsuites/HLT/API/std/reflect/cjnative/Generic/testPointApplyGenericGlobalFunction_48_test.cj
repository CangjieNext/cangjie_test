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
class testPointApplyGenericGlobalFunction_48 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_671(): Unit {
        packageInfo
            .getFunctions("globalFunction_236")[0i64]
            .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()],
                [GenericClassWith2TypeParameters<UInt8, UInt8>()])
        try {
            packageInfo
                .getFunctions("globalFunction_236")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()], [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#16048: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_236")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#16049: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_236")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#16050: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_236")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#16051: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_236")[0i64].apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#16052: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_236")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#16053: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_236")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16054: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_236")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#16055: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_236")[0i64].apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#16056: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_236")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#16057: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_236")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16058: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_236")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#16059: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_236")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#16060: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_236")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#16061: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_236")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#16062: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_236")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#16063: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_236")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#16064: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_236")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#16065: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_236")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#16066: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_672(): Unit {
        packageInfo
            .getFunctions("globalFunction_237")[0i64]
            .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()],
                [GenericClassWith2TypeParameters<UInt16, UInt16>()])
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#16067: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [GenericClassWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#16068: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#16069: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#16070: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_237")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#16071: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_237")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#16072: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16073: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#16074: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_237")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#16075: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_237")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#16076: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16077: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#16078: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#16079: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#16080: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#16081: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#16082: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#16083: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#16084: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_237")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16085: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_673(): Unit {
        packageInfo
            .getFunctions("globalFunction_238")[0i64]
            .apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()],
                [GenericClassWith2TypeParameters<UInt32, UInt32>()])
        try {
            packageInfo
                .getFunctions("globalFunction_238")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [GenericClassWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#16086: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_238")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [GenericClassWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#16087: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_238")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#16088: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_238")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#16089: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_238")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#16090: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_238")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#16091: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_238")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16092: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_238")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#16093: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_238")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#16094: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_238")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#16095: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_238")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16096: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_238")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()],
                    [GenericClassWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#16097: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_238")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()],
                    [GenericClassWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#16098: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_238")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>()],
                    [GenericClassWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#16099: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_238")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#16100: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_238")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#16101: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_238")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#16102: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_238")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#16103: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_238")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16104: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_674(): Unit {
        packageInfo
            .getFunctions("globalFunction_239")[0i64]
            .apply([TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()],
                [GenericClassWith2TypeParameters<UInt64, UInt64>()])
        try {
            packageInfo
                .getFunctions("globalFunction_239")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [GenericClassWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#16105: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_239")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Bool>()], [GenericClassWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#16106: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_239")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#16107: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_239")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#16108: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_239")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#16109: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_239")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#16110: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_239")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16111: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_239")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#16112: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_239")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#16113: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_239")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#16114: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_239")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16115: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_239")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#16116: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_239")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#16117: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_239")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#16118: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_239")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#16119: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_239")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#16120: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_239")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#16121: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_239")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#16122: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_239")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16123: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_675(): Unit {
        packageInfo
            .getFunctions("globalFunction_240")[0i64]
            .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>()],
                [GenericClassWith2TypeParameters<Float32, Float32>()])
        try {
            packageInfo
                .getFunctions("globalFunction_240")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Int8>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#16124: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_240")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#16125: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_240")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>()])
            @Expect("assertion#16126: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_240")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#16127: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_240")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#16128: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_240")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#16129: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_240")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16130: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_240")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#16131: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_240")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#16132: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_240")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#16133: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_240")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16134: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_240")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#16135: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_240")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Int8>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#16136: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_240")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#16137: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_240")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Float32, Float32>(), 114.514000f64])
            @Expect("assertion#16138: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_240")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#16139: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo.getFunctions("globalFunction_240")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#16140: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_240")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#16141: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_240")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Int32>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16142: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }
}
