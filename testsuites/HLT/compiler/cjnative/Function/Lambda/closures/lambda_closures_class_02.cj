/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    return 0
}

open class Boo {
    public static var s1: Int32 = 1
    public var s2: Int64 = 1
}

class Coo <: Boo {
    public var a0 = 0
    public static var a1 = 1
    public var a3: Int32
    public let a4 = 2
    public let a5: Int32

    public init(y: Int32) {
        var z = {x: Int32 => x + 1 + s1}
        a3 = z(1)
        a5 = z(2)
    }

    public init(y: Int64) { // auto insert super()
        var z = {x: Int32 => x + 1 + Int32(super.s2)}
        a3 = z(1)
        a5 = z(2)
    }

    public init(y: Unit) {
        var z = {x: Int32 => x + 1 + Int32(a1)}
        a3 = z(1)
        a5 = z(2)
    }

    public init(y: UInt32) {
        this('a')
        var z = {x: Int32 => x + 1 + Int32(this.a0)}
        a3 = z(1)
        a5 = z(2)
    }

    public init(y: Float32) {
        var z = {x: Int32 => x + 1 + Int32(Coo.a1)}
        a3 = z(1)
        a5 = z(2)
    }

    public init(y: Rune) {
        var z = {x: Int32 => x + 1 + Int32(this.a0)}
        a3 = z(1)
        a5 = z(2)
    }

    public init(y: String) {
        var z = {x: Int32 => x + 1 + Int32(a0)}
        a3 = z(1)
        a5 = z(2)
    }
}
// ASSERT: scan sema_cannot_assign_to_immutable
// ASSERT: scan sema_illegal_usage_of_member
