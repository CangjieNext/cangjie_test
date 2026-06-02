// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC-PIPE-1: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan An exception has occurred:
// ASSERT: regex ^StackOverflowError$
// ASSERT: regex at default.foo\(\)\(.*error_throw1.cj\)$
// ASSERT: regex at default.foo\(\)\(.*error_throw1.cj:16\)$
// ASSERT: regex at default.foo\(\)\(.*error_throw1.cj:16\)$

func foo(): Unit {
    foo()
}

main(): Unit {
    foo()
}
