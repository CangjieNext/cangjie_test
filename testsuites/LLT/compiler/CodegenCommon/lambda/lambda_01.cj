// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan Hello

func goo(x: () -> Int64): () -> Int64 {
    x
}

main() {
    let a: Int64 = 0
    func foo() {
        println("Hello")
        return a
    }
    goo(foo)()
    return 0
}
