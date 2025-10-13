/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan Compatible!

package test_stable_abi

import std.random.*

public open class A {
    let a: Int64 = 10
}

public class B <: A {
    let b: Int64 = 20
}

public struct Rectangle {
    let width = 10
    static let a1 = 20

    public func getWidth(): Int64 {
        return width
    }

    static func geta<T, U>(): Int64 {
        return 0
    }

    public static func getb<T, U>(): Int64 where T <: ToString, U <: Random {
        return 0
    }

    public static func getc<T, U>(): Int64 where T <: Random {
        return 0
    }

    static func getd<T>(): Int64 where T <: ToString {
        return 0
    }

    @Frozen
    public static func gete() {
        let x = getd()
        return x
    }

    public static func getf<T, U>(): Int64 {
        return 0
    }

    static func getg<T, U>(): Int64 where T <: ToString, U <: Random {
        return 0
    }

    @Frozen
    public static func geth() {
        let x = getg()
        return x
    }

    public static func geti<T, U>(): Int64 where T <: ToString, U <: Random {
        return 0
    }

    public static func getj<T, U>(): Int64 where T <: B, U <: Random {
        return 0
    }

    static func getk<T, U>(): Int64 where T <: B, U <: Random {
        return 0
    }

    @Frozen
    public static func getl() {
        let x = getk()
        return x
    }
}
