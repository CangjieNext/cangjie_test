/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

let score: Bool = true
var scoreResult: String = match (score) {
    case false => "one"
    case false => "one" // unreachable
    case true => "one"
    case _ => "one" // unreachable
}

main() {
    return 0
}
// ASSERT: scan sema_unreachable_pattern
