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
class testPointApplyGenericGlobalFunction_38 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_621(): Unit {
        packageInfo
            .getFunctions("globalFunction_186")[0i64]
            .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [true])
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [true])
            @Expect("assertion#15098: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [true])
            @Expect("assertion#15099: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [true])
            @Expect("assertion#15100: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15101: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_186")[0i64].apply([TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15102: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#15103: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15104: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15105: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_186")[0i64].apply([TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15106: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#15107: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15108: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [true, 114.514000f64])
            @Expect("assertion#15109: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [true, 114.514000f64])
            @Expect("assertion#15110: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [true, 114.514000f64])
            @Expect("assertion#15111: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [true, 114.514000f64])
            @Expect("assertion#15112: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#15113: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#15114: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#15115: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_186")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#15116: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_622(): Unit {
        packageInfo
            .getFunctions("globalFunction_187")[0i64]
            .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [1i8])
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [1i8])
            @Expect("assertion#15117: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [1i8])
            @Expect("assertion#15118: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [1i8])
            @Expect("assertion#15119: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15120: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_187")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15121: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_187")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15122: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15123: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15124: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_187")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15125: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_187")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15126: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15127: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [1i8, 114.514000f64])
            @Expect("assertion#15128: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [1i8, 114.514000f64])
            @Expect("assertion#15129: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [1i8, 114.514000f64])
            @Expect("assertion#15130: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [1i8, 114.514000f64])
            @Expect("assertion#15131: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [114.514000f64])
            @Expect("assertion#15132: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [114.514000f64])
            @Expect("assertion#15133: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [114.514000f64])
            @Expect("assertion#15134: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#15135: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_623(): Unit {
        packageInfo
            .getFunctions("globalFunction_188")[0i64]
            .apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [1i16])
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [1i16])
            @Expect("assertion#15136: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [1i16])
            @Expect("assertion#15137: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [1i16])
            @Expect("assertion#15138: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#15139: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_188")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#15140: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_188")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15141: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15142: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#15143: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_188")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#15144: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_188")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15145: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15146: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [1i16, 114.514000f64])
            @Expect("assertion#15147: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [1i16, 114.514000f64])
            @Expect("assertion#15148: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [1i16, 114.514000f64])
            @Expect("assertion#15149: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [1i16, 114.514000f64])
            @Expect("assertion#15150: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [114.514000f64])
            @Expect("assertion#15151: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [114.514000f64])
            @Expect("assertion#15152: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [114.514000f64])
            @Expect("assertion#15153: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#15154: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_624(): Unit {
        packageInfo
            .getFunctions("globalFunction_189")[0i64]
            .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [1i32])
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [1i32])
            @Expect("assertion#15155: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>()], [1i32])
            @Expect("assertion#15156: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [1i32])
            @Expect("assertion#15157: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15158: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_189")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15159: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_189")[0i64].apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#15160: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15161: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15162: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_189")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15163: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_189")[0i64].apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#15164: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15165: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [1i32, 114.514000f64])
            @Expect("assertion#15166: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [1i32, 114.514000f64])
            @Expect("assertion#15167: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>()], [1i32, 114.514000f64])
            @Expect("assertion#15168: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [1i32, 114.514000f64])
            @Expect("assertion#15169: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [114.514000f64])
            @Expect("assertion#15170: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [114.514000f64])
            @Expect("assertion#15171: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>()], [114.514000f64])
            @Expect("assertion#15172: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_189")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#15173: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }

    @TestCase
    func TestCase_625(): Unit {
        packageInfo
            .getFunctions("globalFunction_190")[0i64]
            .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [123i64])
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [123i64])
            @Expect("assertion#15174: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [123i64])
            @Expect("assertion#15175: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [123i64])
            @Expect("assertion#15176: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15177: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_190")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15178: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_190")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15179: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15180: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15181: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_190")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15182: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo.getFunctions("globalFunction_190")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15183: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15184: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [123i64, 114.514000f64])
            @Expect("assertion#15185: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [123i64, 114.514000f64])
            @Expect("assertion#15186: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [123i64, 114.514000f64])
            @Expect("assertion#15187: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [123i64, 114.514000f64])
            @Expect("assertion#15188: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [114.514000f64])
            @Expect("assertion#15189: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [114.514000f64])
            @Expect("assertion#15190: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [114.514000f64])
            @Expect("assertion#15191: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#15192: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
    }
}
