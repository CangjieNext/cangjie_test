/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f

class A {
    public A(let b!: Int64 = 0) {
    }
}

type TT = A

extend TT {
    public static func me(a!: Int64 = b) {
    }
}

main(): Int64 {
    if (A.me() == ()) {
        return 0
    }
    return 2
}
// ASSERT: scan sema_static_function_cannot_access_non_static_member
