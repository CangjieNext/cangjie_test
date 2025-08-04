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
    static let a1: I = Subtractable()
    static let a2: I = Subtractable()
    static let a3: String = ""
    static let a4 = Subtractable()
    static let a5 = Subtractable()

    public func getWidth(): Int64 {
        return width
    }

    public static func geta(): I {
        return a1
    }

    public static func getb(): I {
        return a2
    }

    public static func getc(): String {
        return a3
    }

    public static func getd(): Subtractable {
        return a4
    }

    public static func gete(): Subtractable {
        return a5
    }
}
