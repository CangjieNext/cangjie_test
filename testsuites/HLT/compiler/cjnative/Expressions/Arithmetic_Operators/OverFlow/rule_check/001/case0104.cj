/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// (target_ios | target_ios_simulator) ASSERT: scan exception:std.core:OverflowException
// (!(target_ios | target_ios_simulator)) ASSERT: scan OverflowException: add

let a: ((Int8, Int8), Int8) = ((10, 10), 10)
let b: Int8 = 120 + a[0][0]

main() {
    return 0
}

class Color {
} 
public func stripSlashDoubleQuote(s: String): String {
    s.trimEnd("\\\"").trimStart("\\\"")
}