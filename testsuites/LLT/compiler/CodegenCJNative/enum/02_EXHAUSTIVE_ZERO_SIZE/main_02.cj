// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan AAA()

enum EXHAUSTIVE_ZERO_SIZE {
    A(Unit)
}

func foo(e: EXHAUSTIVE_ZERO_SIZE) {
    match (e) {
        case A(u) =>
            print("AAA");
            println(u)
    }
}

main() {
    foo(EXHAUSTIVE_ZERO_SIZE.A(()))
    return 0
}
