/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @No: 4.2.1.6.2.17
  @Scene: modify
  @Visibility: public
  @Object: enum static func
  @Behavior: modify function name
  @Expect: api incompatible & abi incompatible
 */
// LEVEL: 0
// DEPENDENCE: main.cj, template.cj
// EXEC: %compiler %cmp_opt %compile_dylib_opt template.cj -o libstable_abi.%dylib_suffix
// EXEC: %compiler %cmp_opt main.cj %cmp_stable_abi_dylib -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rm libstable_abi.*
// EXEC: %mv test_stable_abi.cjo old.cjo
// EXEC: %compiler %cmp_opt %compile_dylib_opt %f -o libstable_abi.%dylib_suffix
// EXEC: %mv test_stable_abi.cjo new.cjo

// ASSERT: scan Incompatible!
// ASSERT: scan-1 [API/ABI] Deleted public member function of enum visible outside the module.
// ASSERT: scan-not [API]
// ASSERT: scan-not [ABI]
// ASSERT: scan-1 [API/ABI]

// test enum: modify function name
package test_stable_abi

public open class A {
    let a: Int64 = 10
}

public class B <: A {
    let b: Int64 = 20
}

public enum Rectangle {
    | Red | Green | Blue(UInt8)

    public func getWidth(): Int64 {
        return 11
    }

    public static func getabak(a: Int64): Int64 {
        var b = a + 1
        return b
    }

    public static const func getb(a: Int64): Int64 {
        let b = a + 1
        return b
    }

    @Frozen
    public static func getc(a: Int64): Int64 {
        var b = a + 1
        return b
    }

    static func getd() {
        return 1
    }

    @Frozen
    public static func gete() {
        let x = getd()
        return x
    }

    static func getf(a: Int64) {
        return a + 2
    }

    @Frozen
    public static func getg() {
        let y = getf(1)
        return y
    }

    static func geth(a!: Int64, b!: Float64) {
        return Int64(a) + Int64(b)
    }

    @Frozen
    public static func geti() {
        let y = geth(a: 1, b: 2.1)
        return y
    }

    public static func getj(a!: Int64, b!: Float64) {
        return Int64(a) + Int64(b)
    }

    static func getk(a: Int64, b: Float64) {
        return Int64(a) + Int64(b)
    }

    @Frozen
    public static func getl() {
        let y = getk(1, 2.1)
        return y
    }

    public static func getm(a: Int64, b: Float64) {
        return Int64(a) + Int64(b)
    }

    static func geto(a!: Int64) {
        return a + 2
    }

    @Frozen
    public static func getp() {
        let y = geto(a: 1)
        return y
    }

    public static func getq(a: B) {
        return a
    }

    static func getr(a: B) {
        return a
    }

    @Frozen
    public static func gets() {
        let s = B()
        let x = getr(s)
        return 1
    }

    public static func gett(a!: Int64 = 1) {
        return a
    }

    static func getu(a!: Int64 = 2) {
        return a + 2
    }

    @Frozen
    public static func getv() {
        let y = getu(a: 1)
        return y
    }

    public static func getw(): ToString {
        let l = "hello"
        return l
    }

    static func getx(): ToString {
        return "hello"
    }

    @Frozen
    public static func gety() {
        let y = getx()
        return y
    }

    static const func geta1() {
        return 1
    }

    public static const func geta2() {
        let a = geta1()
        return a
    }

    @Frozen
    static func geta3(a!: Int64 = 2) {
        return a + 4
    }

    @Frozen
    public static func geta4() {
        let y = geta3(a: 1)
        return y
    }
}
