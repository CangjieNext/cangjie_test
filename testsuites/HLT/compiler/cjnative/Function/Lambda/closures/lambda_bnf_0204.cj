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
    var r1 = Coo()
    if (r1.a3 != 8) {
        return 1
    }
    var r2 = Coo(1)
    if (r2.a3 != 4) {
        return 2
    }
    if (r2.a5 != 5) {
        return 3
    }
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

    // s1 is not super.s1,s1 is a static variable
    public init(y: Int32, x!: (Int32) -> Int32 = {x: Int32 => x + 1 + Int32(a1) + super.s1}) {
        a3 = x(1)
        a5 = x(2)
    }

    // s2 is super.s2,but cannot visit s2
    public init(y: Int32, z: Int32, x!: (Int32) -> Int32 = {x: Int32 => x + 1 + Int32(a1) + Int32(super.s2)}) {
        a3 = x(1)
        a5 = x(2)
    }

    public init(x!: (Int32) -> Int32 = {x: Int32 => x + 1 + Int32(a1) + Int32(this.a0)}) {
        a3 = x(1)
        a5 = x(2)
    }

    public init(y: Rune, x!: (Int64) -> Int64 = {x: Int64 => x + 1 + Int64(a1) + Int64(a0)}) {
        a3 = x(1)
        a5 = x(2)
    }
}
// ASSERT: scan sema_object_cannot_access_static_member
// ASSERT: scan sema_assignment_of_member_variable_cannot_use_this_or_super
// ASSERT: scan sema_mismatched_types
