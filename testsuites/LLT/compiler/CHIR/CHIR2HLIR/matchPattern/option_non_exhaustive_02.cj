// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %n.cj %diag_json -o %output 2>&1 | compare %f

let my_bool = 1 < 2

main() {
    let x = match ((Some(true), true)) {
        case (None, _) => 0
        case (Some(true), false) => 1
        case (Some(true), false) => 1
    }
    x
}
// ASSERT: scan sema_unreachable_pattern
// ASSERT: scan sema_nonexhuastive_patterns
