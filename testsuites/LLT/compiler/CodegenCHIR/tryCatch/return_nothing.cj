// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1| compare %f
// ASSERT: scan foo
// ASSERT: scan catched
// ASSERT: scan finally

func foo() {
    println("foo")
    throw Exception()
}

main() {
    try {
        foo()
    } catch (_) {
        println("catched")
    } finally {
        println("finally")
    }
    return 0
}
