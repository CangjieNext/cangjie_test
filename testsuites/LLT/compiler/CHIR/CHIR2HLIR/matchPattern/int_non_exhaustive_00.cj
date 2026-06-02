// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %n.cj %diag_json -o %output 2>&1 | compare %f

main() {
    let x = match (10) {
        case 1 | 2 | 3 | 0x01 | 0x02 | 0x03 | 0x04 => 0
    }
    x
}
// ASSERT: scan sema_unreachable_pattern
// ASSERT: scan sema_nonexhuastive_patterns
