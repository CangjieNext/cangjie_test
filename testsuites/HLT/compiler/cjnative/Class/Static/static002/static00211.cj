/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface A {
    func i() {}
    static func test(input!: Unit = this.i()) {
        this.i()
    }
}

class B {
    func i() {}
    static func test(input!: Unit = this.i()) {
        this.i()
    }
}

abstract class C {
    func i() {}
    func j(): Unit
    static func test(input!: Unit = this.i()) {
        this.i()
    }
    static func test2(input!: Unit = this.i()) {
        this.i()
    }
}

main() {
    return 1
}
// ASSERT: scan sema_cannot_have_default_param
// ASSERT: scan sema_static_members_cannot_call_members
// ASSERT: scan sema_invalid_member_visibility_in_class
