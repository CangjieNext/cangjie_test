/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface X {
    func i() {}
}

interface A <: X {
    static func test(input!: Unit = super.i()) {
        super.i()
    }
}

open class Y {
    func i() {}
}

class B <: Y {
    static func test(input!: Unit = super.i()) {
        super.i()
    }
}

abstract class Z {
    func i() {}
    func j(): Unit
}

abstract class C <: Z {
    static func test(input!: Unit = super.i()) {
        super.i()
    }
    static func test2(input!: Unit = super.i()) {
        super.i()
    }
}

main() {
    return 1
}
// ASSERT: scan sema_cannot_have_default_param
// ASSERT: scan sema_static_members_cannot_call_members
// ASSERT: scan sema_invalid_member_visibility_in_class
