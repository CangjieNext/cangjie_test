/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

var a = 0

open class C1 {
    private func f() {
        a = 3
    }
}

class C2 <: C1 {
    public override func f() {
        super.f()
    }
}

main(): Int64 {
    C2().f()
    return (a - 3)
}
// ASSERT: scan sema_no_match_function_declaration_for_call
