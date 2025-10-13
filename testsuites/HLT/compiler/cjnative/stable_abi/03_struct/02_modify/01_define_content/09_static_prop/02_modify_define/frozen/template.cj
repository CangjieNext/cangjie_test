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

    @Frozen
    public mut static prop geta: Int64 {
        get() {
            println("get")
            a
        }
        set(value) {
            println("set")
            a = value
        }
    }

    mut static prop getb: Int64 {
        get() {
            println("get")
            a
        }
        set(value) {
            println("set")
            a = value
        }
    }
}

public struct S1 {
    static var a = 20

    @Frozen
    public static prop getb: Int64 {
        get() {
            a
        }
    }

    @Frozen
    mut static prop geta: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    @Frozen
    public func getgeta() {
        return geta
    }
}
