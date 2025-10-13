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
    static var a = 20

    public func getWidth(): Int64 {
        return width
    }

    public mut static prop geta: Int64 {
        get() {
            println("get")
            a + 1
        }
        set(value) {
            println("set")
            a = value + 1
        }
    }

    @Frozen
    public mut static prop getc: Int64 {
        get() {
            println("get")
            a + 1
        }
        set(value) {
            println("set")
            a = value + 1
        }
    }
}

public struct S1 {
    static var a = 20
    static var b = 20
    static var e = 20
    static var f = 20

    public mut static prop geta: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    mut static prop getb: Int64 {
        get() {
            b
        }
        set(value) {
            b = value
        }
    }

    @Frozen
    public func f1() {
        getb
    }

    @Frozen
    public static prop gete: Int64 {
        get() {
            e
        }
    }

    @Frozen
    mut static prop getf: Int64 {
        get() {
            f
        }
        set(value) {
            f = value
        }
    }

    @Frozen
    public func f2() {
        getf
    }
}
