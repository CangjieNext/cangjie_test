/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan Compatible!

package test_stable_abi

public interface I {
    func f(): Int64
}

public interface Addable <: I {
    func add(other: Int64): Int64
}

public open class Subtractable <: Addable {
    public open func add(other: Int64): Int64 {
        return 0
    }

    public open func sub(other: Int64): Int64 {
        return 0
    }

    public open func f(): Int64 {
        return 0
    }
}

public class MyInt <: Subtractable {
    var value = 0
    public func add(other: Int64): Int64 {
        value + other
    }
    public func sub(other: Int64): Int64 {
        value - other
    }

    public func f(): Int64 {
        return 0
    }
}

public struct Rectangle {
    static let width = 10
    static var a1: I = Subtractable()
    static var a2: I = Subtractable()
    static var a3: Addable = Subtractable()
    static var a4 = Subtractable()
    static var a5 = Subtractable()

    public func getWidth(): Int64 {
        return width
    }

    public mut static prop geta: I {
        get() {
            println("get")
            a1
        }
        set(value) {
            println("set")
            a1 = value
        }
    }

    public mut static prop getb: I {
        get() {
            println("get")
            a2
        }
        set(value) {
            println("set")
            a2 = value
        }
    }

    public mut static prop getc: Addable {
        get() {
            println("get")
            a3
        }
        set(value) {
            println("set")
            a3 = value
        }
    }

    public mut static prop getd: Subtractable {
        get() {
            println("get")
            a4
        }
        set(value) {
            println("set")
            a4 = value
        }
    }

    public mut static prop gete: Subtractable {
        get() {
            println("get")
            a5
        }
        set(value) {
            println("set")
            a5 = value
        }
    }
}
