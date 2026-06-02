/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

var c: Int32 = 0

class R {
    private func a() {
        c = 10
    }
}

let b = R().a

main(): Int64 {
    let d = R().a

    R().a()
    b()
    return Int64(c - 10)
}
// ASSERT: scan sema_invalid_access_function
// ASSERT: scan sema_no_match_function_declaration_for_call
