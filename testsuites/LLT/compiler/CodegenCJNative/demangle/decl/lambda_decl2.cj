// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC-PIPE-1: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan default::foo(Int64, () -> Int64)
func foo(a: Int64, b: () -> Int64): Int64 {
    throw Exception("exception")
}

main() {
    let g = foo
    g(1, {=> 0})
    0
}
