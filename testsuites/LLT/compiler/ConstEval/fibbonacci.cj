// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %compile_lib_opt %n.cj | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
const func fib(n: Int64): Int64 {
    if (n <= 1) {
        return n
    }
    return fib(n - 2) + fib(n - 1)
}
public const fib28: Int64 = fib(28)
