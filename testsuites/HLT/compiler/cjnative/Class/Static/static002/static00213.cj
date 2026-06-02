/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class Y {
    let i = 1
}

class B {
    static func test(input!: Unit = super.i) {
        super.i
    }
}

abstract class Z {
    let i = 1
}

abstract class C <: Z {
    static func test(input!: Unit = super.i) {
        super.i
    }
}

main() {
    return 1
}
// ASSERT: scan sema_static_members_cannot_call_members
// ASSERT: scan sema_not_member_of
// ASSERT: scan sema_mismatched_types
