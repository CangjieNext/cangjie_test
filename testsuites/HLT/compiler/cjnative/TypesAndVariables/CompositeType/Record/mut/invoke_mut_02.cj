/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

struct R {
    public var a = 3
    private mut func c(b: Int64): Int64 {
        this.a = b
        return this.a
    }
}

main() {
    var b = R()
    b.c(99)
    return (b.a - 99)
}
// ASSERT: scan sema_no_match_function_declaration_for_call
