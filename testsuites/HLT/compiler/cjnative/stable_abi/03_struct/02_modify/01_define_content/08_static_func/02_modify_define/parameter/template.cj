/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan Compatible!

package test_stable_abi

public struct Rectangle {
    let width = 10
    public func getWidth(): Int64{
        return width
    }
}

open public class A {const init() {}}
public class B <: A {const init() {}}
public class C <: A {const init() {}}

public struct S1 {
    public static func f1(a:Float64, b:B, c!:Int64, d!:Int64 = 1) {
        return a
    }

    const static func f2(a:Float64, b:B, c!:Int64, d!:Int64 = 2) {
        return a
    }
    public const static func f22() {
        return f2(1.1, B(), c:1, d:2)
    }

    static func f3(a:Float64, b:B, c!:Int64, d!:Int64 = 3) {
        return a
    }
    @Frozen
    public static func f33() {
        return f3(1.1, B(), c:1, d:3)
    }

    static func f4(a:Float64, b:B, c!:Int64, d!:Int64 = 4) {
        return a
    }
}

struct S2 {
    public static func f1(a:Float64, b:B, c!:Int64, d!:Int64 = 1) {
        return a
    }

    const static func f2(a:Float64, b:B, c!:Int64, d!:Int64 = 2) {
        return a
    }
    public const static func f22() {
        return f2(1.1, B(), c:1, d:2)
    }

    static func f3(a:Float64, b:B, c!:Int64, d!:Int64 = 3) {
        return a
    }
    @Frozen
    public static func f33() {
        return f3(1.1, B(), c:1, d:3)
    }

    static func f4(a:Float64, b:B, c!:Int64, d!:Int64 = 4) {
        return a
    }
}

public struct S22 {
    let s2 = S2()
}

struct S3 {
    public static func f1(a:Float64, b:B, c!:Int64, d!:Int64 = 1) {
        return a
    }

    const static func f2(a:Float64, b:B, c!:Int64, d!:Int64 = 2) {
        return a
    }
    public const static func f22() {
        return f2(1.1, B(), c:1, d:2)
    }

    static func f3(a:Float64, b:B, c!:Int64, d!:Int64 = 3) {
        return a
    }
    @Frozen
    public static func f33() {
        return f3(1.1, B(), c:1, d:3)
    }

    static func f4(a:Float64, b:B, c!:Int64, d!:Int64 = 4) {
        return a
    }
}

public struct S33 {
    @Frozen
    public static func f() {
        let s3 = S3()
    }
}

struct S4 {
    const init() {}
    public static func f1(a:Float64, b:B, c!:Int64, d!:Int64 = 1) {
        return a
    }

    const static func f2(a:Float64, b:B, c!:Int64, d!:Int64 = 2) {
        return a
    }
    public const static func f22() {
        return f2(1.1, B(), c:1, d:2)
    }

    static func f3(a:Float64, b:B, c!:Int64, d!:Int64 = 3) {
        return a
    }
    @Frozen
    public static func f33() {
        return f3(1.1, B(), c:1, d:3)
    }

    static func f4(a:Float64, b:B, c!:Int64, d!:Int64 = 4) {
        return a
    }
}

public struct S44 {
    const init() {}
    public const static func f() {
        let s4 = S4()
    }
}

struct S5 {
    public static func f1(a:Float64, b:B, c!:Int64, d!:Int64 = 1) {
        return a
    }

    const static func f2(a:Float64, b:B, c!:Int64, d!:Int64 = 2) {
        return a
    }
    public const static func f22() {
        return f2(1.1, B(), c:1, d:2)
    }

    static func f3(a:Float64, b:B, c!:Int64, d!:Int64 = 3) {
        return a
    }
    @Frozen
    public static func f33() {
        return f3(1.1, B(), c:1, d:3)
    }

    static func f4(a:Float64, b:B, c!:Int64, d!:Int64 = 4) {
        return a
    }
}

