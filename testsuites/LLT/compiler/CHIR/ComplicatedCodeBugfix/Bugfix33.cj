// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: regex OVjwAQvwVif
// ASSERT: regex nDtvshC63Pa

// Regression: two string literals with colliding FNV-1a 64-bit hashes
// must not share the same LLVM global variable.
// Collision pair 1: OVjwAQvwVif / nDtvshC63Pa

main() {
    var a: String = "OVjwAQvwVif"
    var b: String = "nDtvshC63Pa"
    println(a)
    println(b)
}
