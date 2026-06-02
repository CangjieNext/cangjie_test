// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %n.cj %diag_json -o %output 2>&1 | compare %f

enum E {
    | A(Bool)
    | A(Int64, Bool)
}

main() {
    let x = match ((true, (A(true)))) {
        case (true, A(true)) => 0
        case (false, A(10, true)) => 1
    }
    x
}
// ASSERT: scan sema_nonexhuastive_patterns
