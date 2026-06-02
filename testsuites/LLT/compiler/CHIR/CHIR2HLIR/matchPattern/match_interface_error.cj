// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %n.cj %diag_json -o %output 2>&1 | compare %f

main(): Int64 {
    var c: Equatable<Int64> = 1
    var res = match (c) {
        case 1 => 0
        case _ => 3
    }
    return res - 1
}
// ASSERT: scan sema_mismatched_types
