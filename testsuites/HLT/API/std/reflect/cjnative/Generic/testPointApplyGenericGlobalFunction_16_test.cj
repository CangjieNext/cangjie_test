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
class testPointApplyGenericGlobalFunction_16 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_511(): Unit {
        try {
            packageInfo.getFunctions("globalFunction_76")[0i64].apply([], [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#13170: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_76")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#13171: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_76")[0i64].apply([], [])
            @Expect("assertion#13172: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_76")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#13173: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_76")[0i64].apply([], [])
            @Expect("assertion#13174: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_76")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#13175: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_76")[0i64]
                .apply([], [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#13176: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_76")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#13177: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_76")[0i64].apply([], [()])
            @Expect("assertion#13178: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_76")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#13179: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_512(): Unit {
        try {
            packageInfo.getFunctions("globalFunction_77")[0i64].apply([], [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#13180: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_77")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#13181: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_77")[0i64].apply([], [])
            @Expect("assertion#13182: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_77")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#13183: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_77")[0i64].apply([], [])
            @Expect("assertion#13184: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_77")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#13185: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_77")[0i64]
                .apply([], [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#13186: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_77")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#13187: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_77")[0i64].apply([], [()])
            @Expect("assertion#13188: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_77")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#13189: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_513(): Unit {
        try {
            packageInfo.getFunctions("globalFunction_78")[0i64].apply([], [GenericStructWith1TypeParameters<UInt32>()])
            @Expect("assertion#13190: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_78")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<UInt32>()])
            @Expect("assertion#13191: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_78")[0i64].apply([], [])
            @Expect("assertion#13192: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_78")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#13193: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_78")[0i64].apply([], [])
            @Expect("assertion#13194: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_78")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#13195: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_78")[0i64]
                .apply([], [GenericStructWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#13196: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_78")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#13197: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_78")[0i64].apply([], [()])
            @Expect("assertion#13198: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_78")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#13199: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_514(): Unit {
        try {
            packageInfo.getFunctions("globalFunction_79")[0i64].apply([], [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#13200: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_79")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#13201: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_79")[0i64].apply([], [])
            @Expect("assertion#13202: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_79")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#13203: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_79")[0i64].apply([], [])
            @Expect("assertion#13204: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_79")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#13205: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_79")[0i64]
                .apply([], [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#13206: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_79")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#13207: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_79")[0i64].apply([], [()])
            @Expect("assertion#13208: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_79")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#13209: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_515(): Unit {
        try {
            packageInfo.getFunctions("globalFunction_80")[0i64].apply([], [GenericStructWith1TypeParameters<Float32>()])
            @Expect("assertion#13210: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_80")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Float32>()])
            @Expect("assertion#13211: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_80")[0i64].apply([], [])
            @Expect("assertion#13212: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_80")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#13213: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_80")[0i64].apply([], [])
            @Expect("assertion#13214: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_80")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#13215: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_80")[0i64]
                .apply([], [GenericStructWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#13216: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_80")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#13217: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_80")[0i64].apply([], [()])
            @Expect("assertion#13218: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_80")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#13219: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
    }
}
