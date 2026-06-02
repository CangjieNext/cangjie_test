/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %compile_lib_opt %f -o %output

class A {
    public A(let b!: Int32 = 0) {
    }
}

interface I {
    func foo() {
    }
}

extend A {
    public static func me(a!: Int32 = foo()) {
    }
}

main(): Int64 {
    if (A().me() == ()) {
        return 0
    }
    return 2
}
// ASSERT: scan sema_undeclared_identifier
// ASSERT: scan sema_object_cannot_access_static_member
