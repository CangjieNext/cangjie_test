/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args  | compare %f
// ASSERT: scan-begin 你
// ASSERT: scan-next 好
import std.env.*

main() {
    let a: Rune = r'\u{4f60}'
    let b: Rune = r'\u{597d}'
    println(a)
    println(b)
}
