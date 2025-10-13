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
class testPointApplyGenericGlobalFunction_6 {
    let packageInfo = PackageInfo.get("dependency")

    @TestCase
    func TestCase_461(): Unit {
        try {
            packageInfo.getFunctions("globalFunction_26")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#12670: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_26")[0i64].apply([TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#12671: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_26")[0i64].apply([], [])
            @Expect("assertion#12672: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_26")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12673: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_26")[0i64].apply([], [])
            @Expect("assertion#12674: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_26")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12675: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_26")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#12676: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_26")[0i64]
                .apply([TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#12677: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_26")[0i64].apply([], [()])
            @Expect("assertion#12678: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_26")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#12679: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_462(): Unit {
        try {
            packageInfo.getFunctions("globalFunction_27")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#12680: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_27")[0i64].apply([TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#12681: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_27")[0i64].apply([], [])
            @Expect("assertion#12682: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_27")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12683: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_27")[0i64].apply([], [])
            @Expect("assertion#12684: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_27")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12685: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_27")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#12686: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_27")[0i64]
                .apply([TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#12687: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_27")[0i64].apply([], [()])
            @Expect("assertion#12688: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_27")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#12689: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_463(): Unit {
        try {
            packageInfo.getFunctions("globalFunction_28")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#12690: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_28")[0i64].apply([TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#12691: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_28")[0i64].apply([], [])
            @Expect("assertion#12692: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_28")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12693: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_28")[0i64].apply([], [])
            @Expect("assertion#12694: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_28")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12695: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_28")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#12696: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_28")[0i64]
                .apply([TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#12697: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_28")[0i64].apply([], [()])
            @Expect("assertion#12698: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_28")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#12699: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_464(): Unit {
        try {
            packageInfo.getFunctions("globalFunction_29")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#12700: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_29")[0i64].apply([TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#12701: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_29")[0i64].apply([], [])
            @Expect("assertion#12702: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_29")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12703: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_29")[0i64].apply([], [])
            @Expect("assertion#12704: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_29")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12705: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_29")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#12706: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_29")[0i64]
                .apply([TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#12707: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_29")[0i64].apply([], [()])
            @Expect("assertion#12708: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_29")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#12709: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_465(): Unit {
        try {
            packageInfo.getFunctions("globalFunction_30")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#12710: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_30")[0i64].apply([TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#12711: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_30")[0i64].apply([], [])
            @Expect("assertion#12712: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_30")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12713: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_30")[0i64].apply([], [])
            @Expect("assertion#12714: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_30")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12715: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_30")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#12716: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_30")[0i64]
                .apply([TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#12717: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_30")[0i64].apply([], [()])
            @Expect("assertion#12718: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_30")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#12719: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
    }
}
