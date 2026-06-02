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
    static func test() {
        i()
    }
}

class B {
    func i() {}
    static func test() {
        i()
    }
}

abstract class C {
    func i() {}
    func j(): Unit
    static func test(a: Int32) {
        j()
    }
    static func test() {
        i()
    }
}

main() {
    A.test()
    B.test()
    C.test()
    return 1
}
// ASSERT: scan sema_static_function_cannot_access_non_static_member
// ASSERT: scan sema_invalid_member_visibility_in_class
// ASSERT: scan sema_no_match_function_declaration_for_call
