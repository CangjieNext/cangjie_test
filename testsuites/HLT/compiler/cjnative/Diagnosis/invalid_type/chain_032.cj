/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

let v1 = Option<Int64>.Some(100) + 1
let v2 = Option<Int64>.None + 2
let r1: Float64 = v1 ?? 0
let r2: Rune = v2 ?? 0

main() {
    return 1
}
// ASSERT: scan sema_invalid_binary_expr
