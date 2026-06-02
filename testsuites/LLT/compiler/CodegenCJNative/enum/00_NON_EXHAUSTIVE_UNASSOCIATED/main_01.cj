// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan BBB

enum NON_EXHAUSTIVE_UNASSOCIATED {
    A | B | ...
}

func foo(e: NON_EXHAUSTIVE_UNASSOCIATED) {
    match (e) {
        case A => println("AAA")
        case B => println("BBB")
        case _ => println("unknown")
    }
}

main() {
    foo(NON_EXHAUSTIVE_UNASSOCIATED.B)
    return 0
}
