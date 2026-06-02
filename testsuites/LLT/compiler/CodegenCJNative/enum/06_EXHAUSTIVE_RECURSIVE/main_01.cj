// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan AAABBB

enum EXHAUSTIVE_RECURSIVE { // Recursive
    A(EXHAUSTIVE_RECURSIVE) | B | C
}

func foo(e: EXHAUSTIVE_RECURSIVE): Int64 {
    match (e) {
        case A(e) =>
            print("AAA");
            foo(e)
        case B => println("BBB");
        case C => println("CCC");
    }
    return 0
}

main() {
    var e1 = EXHAUSTIVE_RECURSIVE.B
    foo(EXHAUSTIVE_RECURSIVE.A(e1))
    return 0
}
