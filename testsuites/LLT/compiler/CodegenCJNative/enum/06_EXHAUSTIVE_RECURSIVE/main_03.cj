// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan AAABBB666CCC

struct SSSS {
    public var xxxx: EXHAUSTIVE_RECURSIVE = EXHAUSTIVE_RECURSIVE.B(666, EXHAUSTIVE_RECURSIVE.C)
}

enum EXHAUSTIVE_RECURSIVE { // Recursive
    A(SSSS) | B(Int64, EXHAUSTIVE_RECURSIVE) | C
}

func foo(e: EXHAUSTIVE_RECURSIVE): Int64 {
    match (e) {
        case A(ssss) =>
            print("AAA");
            foo(ssss.xxxx)
        case B(i64, e) =>
            print("BBB");
            print(i64);
            foo(e)
        case C => println("CCC");
    }
    return 0
}

main() {
    foo(EXHAUSTIVE_RECURSIVE.A(SSSS()))
    return 0
}
