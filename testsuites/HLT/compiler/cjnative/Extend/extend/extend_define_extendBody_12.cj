/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface I {}

class A <: I {
    var a = 2
}

extend Int64 {
    private func f<T>(a: T, b!: Int64 = 0) where T <: I {
        return 1
    }
    private func f(a: String, b: String) {
        return 2
    }
}

main(): Int64 {
    1.f("", "")
    1.f<A>(A())
    return 1;
}
// ASSERT: scan sema_no_match_function_declaration_for_call
