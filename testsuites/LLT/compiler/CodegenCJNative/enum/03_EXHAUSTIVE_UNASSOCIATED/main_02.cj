// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan BBB

enum EXHAUSTIVE_UNASSOCIATED<T> {
    A | B
}

func foo<T>(e: EXHAUSTIVE_UNASSOCIATED<T>) {
    match (e) {
        case A => println("AAA")
        case B => println("BBB")
    }
}

main() {
    foo<Int64>(EXHAUSTIVE_UNASSOCIATED.B)
    return 0
}
